// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'common/widget/appbar.dart';
import '../page/home_page.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
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
          title: "Scanner",
        ),
        body: Center(
          child: Text(
            'Scanner to be implemented',
            style: TextStyle(fontSize: 24, color: Colors.white24),
          ),
        ),
      ),
    );
  }
}
