import 'package:flutter/material.dart';
import 'common/widget/appbar.dart';
import '../page/home_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
          title: "Notification",
        ),
        body: Center(
          child: Text(
            'Notification to be implemented',
            style: TextStyle(fontSize: 24, color: Colors.white24),
          ),
        ),
      ),
    );
  }
}
