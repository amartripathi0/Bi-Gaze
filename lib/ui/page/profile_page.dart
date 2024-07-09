// ignore_for_file: deprecated_member_use

import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      // Add cases for other indexes as needed
    }
  }

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
      child: Scaffold(
        appBar: const CommonAppBar(
          title: "Profile",
        ),
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        body: AnimatedBackground(
          behaviour: SpaceBehaviour(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
          vsync: this,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(219, 255, 255, 255)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(104, 103, 101, 101),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                16.0), // Set the border radius here
                            child: Image.asset(
                              'assets/images/test_assets/profile_demo.jpeg', // Update the path to your profile picture
                              width: 100,
                              height: 100,

                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vikaṭa Bālakaḥ',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'User ID: vikaṭabālakaḥ13',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 166, 166, 166),
                                ),
                              ),
                              SizedBox(height: 6),
                              // Add more profile information here if needed
                              Text(
                                'Additional Information',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 166, 166, 166)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
