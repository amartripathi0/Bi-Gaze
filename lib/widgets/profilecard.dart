import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/profile_details_page.dart';

class ProfileCard extends StatefulWidget {
  final String userId;

  const ProfileCard({
    super.key,
    required this.userId,
    required String imagePath,
    required String name,
    required String additionalInfo,
  });

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isLoading = true;
  String? imagePath;
  String? name;
  String? uname;
  String? additionalInfo;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('userinfo')
          .doc(widget.userId)
          .get();

      if (snapshot.exists) {
        setState(() {
          imagePath = snapshot['imagePath'] ??
              'assets/images/test_assets/profile_demo.jpeg';
          name = snapshot['name'];
          uname = snapshot['uname'];
          additionalInfo = snapshot['email'];
          isLoading = false;
        });
      } else {
        print("No data found for user: ${widget.userId}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (name == null || additionalInfo == null) {
      return const Center(
        child: Text(
          'No User Data Available',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailsPage(
              userId: widget.userId,
              initialEmail: additionalInfo!,
              initialName: name!,
              initialUsername: name!,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(219, 255, 255, 255)),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(104, 103, 101, 101),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.network(
                  imagePath!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'User name: $uname',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 166, 166, 166),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      additionalInfo!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 166, 166, 166),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
