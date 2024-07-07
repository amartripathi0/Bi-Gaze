// ignore_for_file: deprecated_member_use

import 'package:bigaze/ui/dialogues/endsessiondialogue.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  int _currentIndex = 2;

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
          title: "Scanner",
        ),
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        body: Container(
          alignment: Alignment.center,
          // child: const CountdownTimer(duration: 300),
          // child: ElevatedButton(
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return GiffyDialog.image(
          //           Image.network(
          //             "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
          //             height: 200,
          //             fit: BoxFit.cover,
          //           ),
          //           title: const Text(
          //             'Image Animation',
          //             textAlign: TextAlign.center,
          //           ),
          //           content: const Text(
          //             'This is a image animation dialog box. This library helps you easily create fancy giffy dialog.',
          //             textAlign: TextAlign.center,
          //           ),
          //           actions: [
          //             TextButton(
          //               onPressed: () => Navigator.pop(context, 'CANCEL'),
          //               child: const Text('CANCEL'),
          //             ),
          //             TextButton(
          //               onPressed: () => Navigator.pop(context, 'OK'),
          //               child: const Text('OK'),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          //   style: ButtonStyle(
          //     elevation: MaterialStateProperty.all(5),
          //     backgroundColor: MaterialStateProperty.all(Colors.black),
          //     shape: MaterialStateProperty.all(
          //       RoundedRectangleBorder(
          //         side: const BorderSide(
          //           color: alertbuttoncolors
          //               .endsessioncolor, // Specify your border color here
          //           width: 2, // Specify the border width
          //         ),
          //         borderRadius: BorderRadius.circular(
          //             8), // Adjust the border radius as needed
          //       ),
          //     ),
          //   ),
          //   child: const Text(
          //     "End Session",
          //     style: TextStyle(color: Colors.white54, fontSize: 14),
          //   ),
          // ),

          // Test=---------------------
          child: const EndSessionButton(),
        ),
      ),
    );
  }
}
