import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final currentIndex = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CoolAppBar(),
      backgroundColor: Colors.black,
      bottomNavigationBar: CoolBottomNavigationBar(
        currentIndex: _currentIndex, // Pass current index
        onTap: (index) => _onItemTapped(context, index), // Handle tap event
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150), // Add spacing at the top
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),
            _buildCard('Card 1 sample to test the interface'),

            // Add more cards as needed
          ],
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        // Navigate to the result page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
        break;
      case 2:
        // Navigate to the scanner page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        // Navigate to the profile page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }

  Widget _buildCard(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 116, vertical: 18),
      child: Card(
        color: const Color.fromARGB(
            255, 132, 130, 130), // You can customize card color here
        elevation: 4, // Adjust elevation as needed
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
