// ignore_for_file: avoid_print

import 'package:bigaze/ui/page/audio_classifier_page.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/object_detection/bndbox.dart';
import 'package:bigaze/object_detection/camera.dart';
import 'package:bigaze/helper/boxes.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import '../../model/proctor_model.dart';
import 'dart:math' as math;
import 'package:provider/provider.dart';
import '../../provider/detections_provider.dart'; // Import the provider class

class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String model;

  const DetectScreen({super.key, required this.cameras, required this.model});

  @override
  State<DetectScreen> createState() => _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  late final OutputProvider outputProvider;
  late final ProctorModel newRecord;
  late Timer _timer;

  // void _updateRecord() {
  //   // Get the current time
  //   final currentTime = DateTime.now().toString().split(' ')[1];

  //   // Append the current time to the time list of the record
  //   newRecord.time.add(currentTime);

  //   // Append the audio and object data from the output provider
  //   newRecord.audio.addAll(outputProvider.audioOutput);
  //   newRecord.object.addAll(outputProvider.objectOutput);

  //   // Optionally, you can update the output provider here if needed

  //   // Add the updated record to the Hive box
  //   try {
  //     boxProctor.add(newRecord);
  //     print('Record updated with ID: ${newRecord.id}');
  //   } catch (e) {
  //     print('Error updating record: $e');
  //   }
  // }

  void _updateRecord() {
    // Get the current time
    final currentTime = DateTime.now().toString().split(' ')[1];

    // Check if the record with the same ID already exists in the box
    final existingRecordIndex = boxProctor.values
        .toList()
        .indexWhere((record) => record.id == newRecord.id);

    if (existingRecordIndex != -1) {
      // If the record already exists, update its time, audio, and object data
      final existingRecord =
          boxProctor.getAt(existingRecordIndex) as ProctorModel;
      existingRecord.time.add(currentTime);
      existingRecord.audio.addAll(outputProvider.audioOutput);
      existingRecord.object.addAll(outputProvider.objectOutput);

      try {
        // Save the updated record back to the Hive box
        boxProctor.putAt(existingRecordIndex, existingRecord);
        print('Record updated with ID: ${existingRecord.id}');
      } catch (e) {
        print('Error updating record: $e');
      }
    } else {
      // If the record doesn't exist, create a new one
      final record = ProctorModel(
        newRecord.id,
        newRecord.date,
        [currentTime], // Start a new list of time with the current time
        outputProvider.audioOutput,
        outputProvider.objectOutput,
      );

      try {
        // Add the new record to the Hive box
        boxProctor.add(record);
        print('New record created with ID: ${record.id}');
      } catch (e) {
        print('Error adding new record: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // provider
    outputProvider = Provider.of<OutputProvider>(context, listen: false);

    // Initialize the ProctorModel object with an initial ID, date, and empty lists
    const uuid = Uuid();
    final id = uuid.v4();
    final date = DateTime.now().toString().split(' ')[0];
    newRecord = ProctorModel(id, date, [], [], []);

    // Start a timer to trigger _addRecord every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRecord();
    });

    // Open the bottom modal sheet when the page is first opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openBottomModalSheet();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _openBottomModalSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      elevation: 20,
      enableDrag: true,

      backgroundColor: const Color.fromARGB(
          0, 0, 0, 0), // Set background color to transparent
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) => Stack(
        children: [
          // Background widget covering the entire screen
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(0, 0, 0, 0)
                  .withOpacity(0), // Adjust opacity as needed
            ),
          ),
          // Bottom modal sheet
          SizedBox(
            height: 160,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(130, 0, 0,
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
