import 'package:flutter/material.dart';

SnackBar neonSnackBar(String message) {
  return SnackBar(
    content: Text(
      "$message 🥁",
      style: const TextStyle(
        color: Color.fromARGB(219, 255, 255, 255), // Neon green text color
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.transparent, // Transparent background for contrast
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(
        color: Color.fromARGB(255, 134, 245, 103), // Neon green border
        width: 2,
      ),
    ),
  );
}
