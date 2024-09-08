import 'package:flutter/material.dart';

SnackBar neonSnackBar(String message) {
  return SnackBar(
    content: TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)), // Slide up animation
            child: Text(
              message,
              style: const TextStyle(
                color:
                    Color.fromARGB(219, 255, 255, 255), // Neon green text color
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    ),
    backgroundColor: const Color.fromARGB(
        140, 0, 0, 0), // Transparent background for contrast
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(
        color: Color.fromARGB(255, 134, 245, 103), // Neon green border
        width: 2,
      ),
    ),
    duration: const Duration(seconds: 1),
  );
}
