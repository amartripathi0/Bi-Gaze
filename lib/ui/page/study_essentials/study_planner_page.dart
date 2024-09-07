import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "STUDY PLANNER"),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       // Navigate to LoginPage
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const LoginScreen()),
      //       );
      //     },
      //     style: ButtonStyle(
      //       backgroundColor: WidgetStateProperty.all(Colors.amberAccent),
      //     ),
      //     child: const Text("Login Page"),
      //   ),
      // ),
    );
  }
}
