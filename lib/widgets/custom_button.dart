import 'package:bigaze/ui/dialogues/signoutdialogue.dart';
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

class CustomAlertButton extends StatelessWidget {
  const CustomAlertButton({
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
            color:
                const Color.fromARGB(255, 245, 103, 103), // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 0, 0)
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
                  const Color.fromARGB(193, 0, 0, 0), // Transparent background
              shadowColor:
                  const Color.fromARGB(209, 0, 0, 0), // No internal shadow
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

class CustomSaveButton extends StatelessWidget {
  const CustomSaveButton({
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
            color: const Color.fromARGB(255, 134, 245, 103),
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 136, 255, 0)
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
                  const Color.fromARGB(193, 0, 0, 0), // Transparent background
              shadowColor:
                  const Color.fromARGB(209, 0, 0, 0), // No internal shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Match the shape of the container
              ),
            ),
            onPressed: onTap,
            child: Text(
              text,
              style: const TextStyle(
                  color:
                      Color.fromARGB(209, 255, 255, 255)), // White text color
            ),
          ),
        ),
      ),
    );
  }
}

// custom signout alert button

class CustomSignoutAlertButton extends StatelessWidget {
  const CustomSignoutAlertButton({
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
            color:
                const Color.fromARGB(255, 245, 103, 103), // White border color
            width: 2, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 0, 0)
                  .withOpacity(0.6), // Red shadow color with opacity
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
                  const Color.fromARGB(193, 0, 0, 0), // Transparent background
              shadowColor:
                  const Color.fromARGB(209, 0, 0, 0), // No internal shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    8), // Match the shape of the container
              ),
            ),
            onPressed: () {
              // Show confirmation dialog before executing the onTap action
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Signoutdialogue();
                },
              );
            },
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
