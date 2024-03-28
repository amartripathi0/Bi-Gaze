import 'package:bigaze/ui/page/audio_classifier_page.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/object_detection/bndbox.dart';
import 'package:bigaze/object_detection/camera.dart';
import 'dart:math' as math;

class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String model;

  const DetectScreen({super.key, required this.cameras, required this.model});

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  @override
  void initState() {
    super.initState();
    // Open the bottom modal sheet when the page is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openBottomModalSheet();
    });
  }

  void _openBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => Stack(
        children: [
          // Background widget covering the entire screen
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0), // Adjust opacity as needed
            ),
          ),
          // Bottom modal sheet
          Padding(
            padding: const EdgeInsets.only(
                top: 300), // Add additional space at the top
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(92, 0, 0,
                    0), // Change the color to the desired background color
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: const AudioClassifier(),
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const ProctorAppBar(title: "P R O C T O R"),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Camera(
            widget.cameras,
            widget.model,
            setRecognitions,
          ),
          BndBox(
              _recognitions ?? [],
              math.max(_imageHeight, _imageWidth),
              math.min(_imageHeight, _imageWidth),
              screen.height,
              screen.width,
              widget.model),
        ],
      ),
    );
  }
}
