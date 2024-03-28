import 'package:bigaze/object_detection/od_ssd_mobilenet.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/home_page.dart';

class ProctorPage extends StatefulWidget {
  const ProctorPage({Key? key}) : super(key: key);

  @override
  State<ProctorPage> createState() => _ProctorPageState();
}

class _ProctorPageState extends State<ProctorPage> {
  @override
  void initState() {
    super.initState();
    // Open the bottom modal sheet when the page is first opened
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
      child: const Scaffold(
        appBar: CommonAppBar(
          title: "P R O C T O R",
        ),
        body: Stack(
          children: [
            // Overlay ObjectDetectionPage
            OdSsdMobileNet(),
          ],
        ),
      ),
    );
  }
}
