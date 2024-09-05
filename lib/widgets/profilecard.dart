import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/profile_details_page.dart';

class ProfileCard extends StatelessWidget {
  final String userId;

  const ProfileCard({
    super.key,
    required this.userId,
    required imagePath,
    required name,
    required additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('userinfo')
          .doc(userId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error fetching user data',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(
            child: Text(
              'No User Data Available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;
        final imagePath =
            data['imagePath'] ?? 'assets/images/test_assets/profile_demo.jpeg';
        final name = data['name'];
        final uname = data['uname'];
        final additionalInfo = data['email'];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileDetailsPage(
                  userId: userId,
                  initialEmail: additionalInfo!,
                  initialName: name!,
                  initialUsername: uname!,
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(219, 255, 255, 255),
                ),
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
                      imagePath,
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
      },
    );
  }
}
