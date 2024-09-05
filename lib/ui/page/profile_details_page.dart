import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDetailsPage extends StatefulWidget {
  final String
      userId; // Assuming userId is used to fetch the user data from Firebase

  const ProfileDetailsPage({super.key, required this.userId});

  @override
  _ProfileDetailsPageState createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController usernameController;
  late TextEditingController dobController;
  late TextEditingController emailController;
  late TextEditingController mobnoController;
  late TextEditingController nationalityController;
  String? profileImage;

  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Fetch user data from Firebase based on userId
      final userDoc = await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          nameController = TextEditingController(text: userDoc['name'] ?? '');
          usernameController =
              TextEditingController(text: userDoc['uname'] ?? '');
          dobController = TextEditingController(text: userDoc['dob'] ?? '');
          emailController = TextEditingController(text: userDoc['email'] ?? '');
          mobnoController = TextEditingController(text: userDoc['mobno'] ?? '');
          nationalityController =
              TextEditingController(text: userDoc['nationality'] ?? '');
          profileImage =
              'assets/images/profile_placeholder.png'; // Default profile image
          isLoading = false; // Loading is done
        });
      }
    } catch (e) {
      // Handle any errors that might occur
      print('Error fetching user data: $e');
    }
  }

  Future<void> _saveChanges() async {
    // Save updated data to Firebase
    await FirebaseFirestore.instance
        .collection('userinfo')
        .doc(widget.userId)
        .update({
      'name': nameController.text,
      'uname': usernameController.text,
      'dob': dobController.text,
      'email': emailController.text,
      'mobno': mobnoController.text,
      'nationality': nationalityController.text,
    });

    Navigator.pop(context); // After saving, return to the previous screen
  }

  Future<void> _changeProfilePicture() async {
    // Simulate picking an image. Replace this with actual image picking logic.
    setState(() {
      profileImage =
          'assets/images/new_profile.png'; // Temporary new image path
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading // Show loading indicator while fetching data
          ? const Center(
              child: CircularProgressIndicator(color: Colors.cyanAccent),
            )
          : Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: _changeProfilePicture,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            profileImage ??
                                'assets/images/profile_placeholder.png', // Safely use profileImage
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Tap the image to change profile picture',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white38,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildEditableField('Full Name', nameController),
                    const SizedBox(height: 16),
                    _buildEditableField('Username', usernameController),
                    const SizedBox(height: 16),
                    _buildEditableField('Date of Birth', dobController),
                    const SizedBox(height: 16),
                    _buildEditableField('Email', emailController),
                    const SizedBox(height: 16),
                    _buildEditableField('Mobile Number', mobnoController),
                    const SizedBox(height: 16),
                    _buildEditableField('Nationality', nationalityController),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _saveChanges,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyanAccent.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
            color: Colors.cyanAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
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
                color: Colors.cyanAccent,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.cyanAccent,
                width: 1,
              ),
            ),
            hintText: 'Enter $label',
            hintStyle: const TextStyle(color: Colors.white38),
          ),
        ),
      ],
    );
  }
}
