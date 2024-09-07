import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class QuizGeneratorPage extends StatefulWidget {
  const QuizGeneratorPage({super.key});

  @override
  State<QuizGeneratorPage> createState() => _QuizGeneratorPageState();
}

class _QuizGeneratorPageState extends State<QuizGeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "QuizΞrix"),
      body: Center(
        child: Text("QUIZ Generator"),
      ),
    );
  }
}
