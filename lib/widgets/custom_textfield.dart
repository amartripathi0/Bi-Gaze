import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.white, // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan
                  .withOpacity(0.6), // Cyan shadow color with opacity
              spreadRadius: 3, // Spreads the shadow to create a glowing effect
              blurRadius: 10, // Softens the shadow
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white), // White text color
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: const Color.fromARGB(
                172, 0, 0, 0), // Semi-transparent background
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(
                  120, 255, 255, 255), // Lighter white for the hint text
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
