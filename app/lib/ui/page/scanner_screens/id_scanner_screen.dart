import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class IdScannerScreen extends StatelessWidget {
  const IdScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "Scan ID"),
    );
  }
}
