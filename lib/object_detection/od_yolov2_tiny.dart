import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:bigaze/object_detection/detect_screen.dart';

class OdYolo extends StatefulWidget {
  const OdYolo({super.key});

  @override
  State<OdYolo> createState() => _OdYoloState();
}

class _OdYoloState extends State<OdYolo> {
  late final List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    setupCameras();
    loadModel();
  }

  loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/models/yolov2_tiny.tflite",
      labels: "assets/models/yolov2_tiny.txt",
    );
    log("$res");
  }

  onSelect() {
    final route = MaterialPageRoute(builder: (context) {
      return DetectScreen(cameras: cameras, model: "Yolo v2");
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
<<<<<<< HEAD
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 153, 99, 167))),
=======
            backgroundColor:
                WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
          ),
>>>>>>> appv2
          child: const Text('Launch 🚀'),
        ),
      ),
    );
  }
}
