import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:bigaze/object_detection/detect_screen.dart';

import 'models.dart';

class ObjectDetectionAll extends StatefulWidget {
  const ObjectDetectionAll({super.key});

  @override
  State<ObjectDetectionAll> createState() => _ObjectDetectionAllState();
}

class _ObjectDetectionAllState extends State<ObjectDetectionAll> {
  late final List<CameraDescription> cameras;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await setupCameras();
  }

  loadModel(model) async {
    String? res;
    switch (model) {
      case yolo:
        res = await Tflite.loadModel(
          model: "assets/models/yolov2_tiny.tflite",
          labels: "assets/models/yolov2_tiny.txt",
        );
        break;

      case mobilenet:
        res = await Tflite.loadModel(
            model: "assets/models/mobilenet_v1_1.0_224.tflite",
            labels: "assets/models/mobilenet_v1_1.0_224.txt");
        break;

      case posenet:
        res = await Tflite.loadModel(
            model:
                "assets/models/posenet_mv1_075_float_from_checkpoints.tflite");
        break;

      default:
        res = await Tflite.loadModel(
            model: "assets/models/ssd_mobilenet.tflite",
            labels: "assets/models/ssd_mobilenet.txt");
    }
    log("$res");
  }

  onSelect(model) {
    loadModel(model);
    final route = MaterialPageRoute(builder: (context) {
      return DetectScreen(cameras: cameras, model: model);
    });
    Navigator.of(context).push(route);
  }

  setupCameras() async {
    try {
      cameras = await availableCameras();
    } on CameraException catch (e) {
      log('Error: $e.code\nError Message: $e.message');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => onSelect(ssd),
              style: const ButtonStyle(
<<<<<<< HEAD
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 153, 99, 167))),
=======
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
              ),
>>>>>>> appv2
              child: const Text(ssd),
            ),
            ElevatedButton(
              onPressed: () => onSelect(yolo),
              style: const ButtonStyle(
<<<<<<< HEAD
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 153, 99, 167))),
=======
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
              ),
>>>>>>> appv2
              child: const Text(yolo),
            ),
            ElevatedButton(
              onPressed: () => onSelect(mobilenet),
              style: const ButtonStyle(
<<<<<<< HEAD
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 153, 99, 167))),
=======
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
              ),
>>>>>>> appv2
              child: const Text(mobilenet),
            ),
            ElevatedButton(
              onPressed: () => onSelect(posenet),
              style: const ButtonStyle(
<<<<<<< HEAD
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 153, 99, 167))),
=======
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 153, 99, 167)),
              ),
>>>>>>> appv2
              child: const Text(posenet),
            ),
          ],
        ),
      ),
    );
  }
}
