import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String userId;
  final String additionalInfo;

  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.userId,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'User ID: $userId',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 166, 166, 166),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  additionalInfo,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 166, 166, 166),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
