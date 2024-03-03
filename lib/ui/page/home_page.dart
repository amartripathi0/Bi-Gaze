import 'dart:ui';

import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final currentIndex = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0; // 🔴 implement later
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CoolAppBar(),
      backgroundColor: Colors.black,
      bottomNavigationBar: CoolBottomNavigationBar(
        currentIndex: currentIndex, // Pass current index
        onTap: (index) =>
            setState(() => currentIndex = index), // Handle tap event
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

  Widget _buildCard(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 116, vertical: 18),
      child: Card(
        color: Colors.white, // You can customize card color here
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
