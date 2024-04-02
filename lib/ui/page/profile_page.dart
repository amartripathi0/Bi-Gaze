// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          title: "Profile",
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
