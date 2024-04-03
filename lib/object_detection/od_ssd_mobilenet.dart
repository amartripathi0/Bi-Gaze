import 'dart:developer';

import 'package:bigaze/ui/theme/color/soothingcolors.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:bigaze/object_detection/detect_screen.dart';
import 'package:simple_animated_button/simple_animated_button.dart';

class OdSsdMobileNet extends StatefulWidget {
  const OdSsdMobileNet({Key? key}) : super(key: key);

  @override
  State<OdSsdMobileNet> createState() => _OdSsdMobileNetState();
}

class _OdSsdMobileNetState extends State<OdSsdMobileNet> {
  late final List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    setupCameras();
    loadModel();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   onSelect();
    // });
  }

  loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/ssd_mobilenet.txt",
    );
    log("$res");
  }

  onSelect() {
    final route = MaterialPageRoute(builder: (context) {
      log("Session started");
      return DetectScreen(cameras: cameras, model: "SSD MobileNet");
    });
    Navigator.of(context).push(route);
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: ${e.code}\nError Message: ${e.description}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedLayerButton(
          onClick: onSelect,
          buttonHeight: 60,
          buttonWidth: 270,
          animationDuration: const Duration(milliseconds: 500),
          animationCurve: Curves.ease,
          topDecoration: BoxDecoration(
            color: SoothingColors.purpleGray.withAlpha(200),
            border: Border.all(),
          ),
          topLayerChild: const Text(
            "Start Session 🚀",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          baseDecoration: BoxDecoration(
            color: const Color.fromARGB(255, 147, 228, 161).withAlpha(200),
            border: Border.all(),
          ),
        ),
      ),
    );
  }
}
