import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class ProfileDetailsPage extends StatefulWidget {
  final String userId;
  final String initialName;
  final String initialUsername;
  final String initialEmail;

  const ProfileDetailsPage({
    super.key,
    required this.userId,
    required this.initialName,
    required this.initialUsername,
    required this.initialEmail,
  });

  @override
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  bool isLoading = true;
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController dobController;
  late TextEditingController mobnoController;
  late TextEditingController nationalityController;
  String? imageUrl;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _fetchUserData();
  }

  void _initializeControllers() {
    nameController = TextEditingController(text: widget.initialName);
    usernameController = TextEditingController(text: widget.initialUsername);
    emailController = TextEditingController(text: widget.initialEmail);
    dobController = TextEditingController();
    mobnoController = TextEditingController();
    nationalityController = TextEditingController();
  }

  Future<void> _fetchUserData() async {
    try {
      print("Fetching data from Firebase for user: ${widget.userId}");

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .get();

      if (snapshot.exists) {
        print("Data fetched: ${snapshot.data()}");
        setState(() {
          nameController.text = snapshot['name'];
          usernameController.text = snapshot['uname'];
          emailController.text = snapshot['email'];
          dobController.text = snapshot['dob'];
          mobnoController.text = snapshot['mobno'];
          nationalityController.text = snapshot['nationality'];
          imageUrl = snapshot['imagePath'];
          isLoading = false;
        });
      } else {
        print(
            "No data found for user: ${widget.userId}. Creating new record...");
        _createUserRecord();
        isLoading = false;
      }
    } catch (error) {
      print("Error fetching user data: $error");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _createUserRecord() async {
    try {
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .set({
        'name': widget.initialName,
        'uname': widget.initialUsername,
        'email': widget.initialEmail,
        'dob': '', // Initially empty, user can edit it
        'mobno': '', // Initially empty, user can edit it
        'nationality': '', // Initially empty, user can edit it
        'imagePath':
            'https://raw.githubusercontent.com/nayan1306/assets/main/profile_demo.jpeg',
      });
      print("User record created for: ${widget.userId}");
    } catch (error) {
      print("Error creating user record: $error");
    }
  }

  Future<void> _saveChanges() async {
    try {
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .update({
        'name': nameController.text,
        'uname': usernameController.text,
        'email': emailController.text,
        'dob': dobController.text,
        'mobno': mobnoController.text,
        'nationality': nationalityController.text,
        'imagePath': imageUrl ??
            'https://raw.githubusercontent.com/nayan1306/assets/main/profile_demo.jpeg',
      });
      print("User data updated successfully for user: ${widget.userId}");
    } catch (error) {
      print("Error updating user data: $error");
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_images/${widget.userId}');
      final uploadTask = storageRef.putFile(_imageFile!);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });

      // Update Firestore with the new image URL
      await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .update({'imagePath': downloadUrl});
      print("Profile image uploaded successfully.");
    } catch (error) {
      print("Error uploading image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Profile Page"),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : imageUrl != null
                                ? NetworkImage(imageUrl!)
                                : const AssetImage(
                                        'assets/images/test_assets/profile_demo.jpeg')
                                    as ImageProvider,
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildEditableField('Name', nameController),
                    const SizedBox(height: 16),
                    _buildEditableField('Username', usernameController),
                    const SizedBox(height: 16),
                    _buildEditableField('Email', emailController),
                    const SizedBox(height: 16),
                    _buildEditableField('Date of Birth', dobController),
                    const SizedBox(height: 16),
                    _buildEditableField('Mobile Number', mobnoController),
                    const SizedBox(height: 16),
                    _buildEditableField('Nationality', nationalityController),
                    const SizedBox(height: 30),
                    CustomSaveButton(
                        onTap: () {
                          _saveChanges();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        text: "Save Changes"),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 201, 184, 255),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 218, 175, 255),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 175, 153, 248),
                width: 1,
              ),
            ),
            hintText: 'Enter $label',
            hintStyle:
                const TextStyle(color: Color.fromARGB(68, 255, 255, 255)),
          ),
        ),
      ],
    );
  }
}
