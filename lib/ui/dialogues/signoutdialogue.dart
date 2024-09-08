import 'package:flutter/material.dart';

import '../page/home_page.dart';

class Signoutdialogue extends StatelessWidget {
  const Signoutdialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius to your needs
                    child: Image.asset(
                      "assets/images/cool_stuff/!.gif",
                      height: 100,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'End Session',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent, // Use your color here
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Once ENDED the session can\'t be restarted and the Session will be permanently terminated.',
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
                    backgroundColor: WidgetStateProperty.all(Colors.black26),
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
                    'Terminate session',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
              backgroundColor: const Color.fromARGB(115, 0, 0, 0),
              shadowColor: const Color.fromARGB(121, 255, 255, 255),
            );
          },
        );
      },
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(5),
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(85, 0, 0, 0)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.redAccent, // Specify your border color here
              width: 2, // Specify the border width
            ),
            borderRadius:
                BorderRadius.circular(8), // Adjust the border radius as needed
          ),
        ),
      ),
      child: const Text(
        "End Session",
        style: TextStyle(color: Colors.white54, fontSize: 14),
      ),
    );
  }
}
