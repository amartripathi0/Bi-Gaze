import 'package:flutter/material.dart';

class DeleteAccountdialogue extends StatelessWidget {
  final VoidCallback onConfirmed; // Add a callback for the sign-out action

  const DeleteAccountdialogue({super.key, required this.onConfirmed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'DELETE ACCOUNT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Deleting your account? The data cosmos will miss you! 🌌',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 238, 225, 225)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Colors.white38),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              const Color.fromARGB(200, 57, 57, 57),
            ),
          ),
          onPressed: () {
            Navigator.pop(context); // Close dialog
            onConfirmed(); // Perform the sign-out action
          },
          child: const Text(
            'Delete account',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      backgroundColor: const Color.fromARGB(223, 0, 0, 0),
      shadowColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
