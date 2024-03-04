import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/home_page.dart'; // Import your routes file

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key); // Fix key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the home page when the back button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Results Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
