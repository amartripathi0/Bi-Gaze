import 'package:flutter/material.dart';
import '../page/home_page.dart';

class Signoutdialogue extends StatelessWidget {
  const Signoutdialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     ClipRRect(
      //       borderRadius: BorderRadius.circular(20.0),
      //       child: Image.asset(
      //         "assets/images/cool_stuff/!.gif",
      //         height: 100,
      //         width: 200,
      //         fit: BoxFit.cover,
      //       ),
      //     )
      //   ],
      // ),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'SIGN OUT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.redAccent, // Use your color here
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Leaving already? The pixels will be lonely without you! 🥺',
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
            backgroundColor:
                WidgetStateProperty.all(const Color.fromARGB(200, 57, 57, 57)),
          ),
          onPressed: () {
            Navigator.pop(context); // Remove current route from stack
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
          },
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
      backgroundColor: const Color.fromARGB(223, 0, 0, 0),
      shadowColor: const Color.fromARGB(121, 255, 255, 255),
    );
  }
}
