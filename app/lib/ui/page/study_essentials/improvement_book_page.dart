import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class ImprovementBook extends StatefulWidget {
  const ImprovementBook({super.key});

  @override
  State<ImprovementBook> createState() => _ImprovementBookState();
}

class _ImprovementBookState extends State<ImprovementBook> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "IMPOROVEMENT BOOK"),
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
