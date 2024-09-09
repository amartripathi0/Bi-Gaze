import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class CustomPractice extends StatefulWidget {
  const CustomPractice({super.key});

  @override
  State<CustomPractice> createState() => _CustomPracticeState();
}

class _CustomPracticeState extends State<CustomPractice> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "CUSTOM PRACTICE"),
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
