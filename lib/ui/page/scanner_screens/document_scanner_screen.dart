import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';

class DocumentScannerScreen extends StatelessWidget {
  const DocumentScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(title: "Scan Document"),
    );
  }
}
