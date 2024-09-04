import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white, // White border color
          width: 2, // Border width
        ),
        boxShadow: [
          BoxShadow(
            color:
                Colors.cyan.withOpacity(0.6), // Cyan shadow color with opacity
            spreadRadius: 5, // Spreads the shadow to create a glowing effect
            blurRadius: 20, // Softens the shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(8), // Same border radius as container
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color.fromARGB(172, 0, 0, 0), // Transparent background
            shadowColor: Colors.transparent, // No internal shadow
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Match the shape of the container
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white), // White text color
          ),
        ),
      ),
    );
  }
}
