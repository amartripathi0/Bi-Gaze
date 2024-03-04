import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/home_page.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key); // Fix key parameter

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the home page when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return false; // Prevent the default back button behavior
      },
      child: const Scaffold(
        appBar: CommonAppBar(
          title: "Result",
        ),
        body: Center(
          child: Text(
            'Results Page',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
