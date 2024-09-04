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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 140,
        height: 50,
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
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(8), // Same border radius as container
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(172, 0, 0, 0), // Transparent background
              shadowColor: Colors.transparent, // No internal shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Match the shape of the container
              ),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white), // White text color
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromARGB(
                  155, 255, 255, 255), // White border color
              width: 2, // Border width
            ),
            color: const Color.fromARGB(214, 0, 0, 0),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan
                    .withOpacity(0.6), // Cyan shadow color with opacity
                spreadRadius:
                    3, // Spreads the shadow to create a glowing effect
                blurRadius: 10, // Softens the shadow
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
