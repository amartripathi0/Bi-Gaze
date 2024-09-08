import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:bigaze/object_detection/detect_screen.dart';

class OdMobileNetVone extends StatefulWidget {
  const OdMobileNetVone({super.key});

  @override
  State<OdMobileNetVone> createState() => _OdMobileNetVoneState();
}

class _OdMobileNetVoneState extends State<OdMobileNetVone> {
  late final List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    setupCameras();
    loadModel();
  }

  loadModel() async {
    String? res = await Tflite.loadModel(
        model: "assets/models/resnet50.tflite",
        labels: "assets/models/resnet50_labels.txt");
    log("$res");
  }

  onSelect() {
    final route = MaterialPageRoute(builder: (context) {
      return DetectScreen(cameras: cameras, model: "Resnet 50");
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
                WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
          ),
          child: const Text('Launch 🚀 Resnet 50'),
        ),
      ),
    );
  }
}
