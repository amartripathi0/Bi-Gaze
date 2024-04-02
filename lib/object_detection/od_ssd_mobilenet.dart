import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:bigaze/object_detection/detect_screen.dart';

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
        child: ElevatedButton(
          onPressed: onSelect,
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 153, 99, 167))),
          child: const Text('Launch 🚀'),
        ),
      ),
    );
  }
}
