// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bigaze/ui/dialogues/endsessiondialogue.dart';
import 'package:bigaze/ui/page/audio_classifier_page.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/widgets/countdowntimer.dart';
import 'package:bigaze/widgets/internetspeed.dart';
import 'package:bigaze/widgets/pingmeter.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/object_detection/bndbox.dart';
import 'package:bigaze/object_detection/camera.dart';
import 'package:bigaze/helper/boxes.dart';
import 'package:uuid/uuid.dart';
import 'package:wakelock/wakelock.dart';
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
  late OverlayEntry _overlayEntry;

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
    // Provider
    outputProvider = Provider.of<OutputProvider>(context, listen: false);

    // Initialize the ProctorModel object with an initial ID, date, and empty lists
    const uuid = Uuid();
    final id = uuid.v4();
    final date = DateTime.now().toString().split(' ')[0];
    newRecord = ProctorModel(id, date, [], [], []);

    // Start a timer to trigger _updateRecord every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRecord();
    });

    _overlayEntry = _createOverlayEntry();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Overlay.of(context).insert(_overlayEntry);
    });

    // Enable wakelock to prevent screen from going off
    Wakelock.enable().then((_) {
      log('Wakelock enabled');
    }).catchError((e) {
      log('Error enabling wakelock: $e');
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _overlayEntry.remove();
    Wakelock.disable().then((_) {
      log('Wakelock disabled');
    }).catchError((e) {
      log('Error disabling wakelock: $e');
    });
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 160,
            decoration: const BoxDecoration(
              color: Color.fromARGB(130, 0, 0, 0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: const AudioClassifier(),
          ),
        ),
      ),
    );
  }

  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;

  void setRecognitions(recognitions, imageHeight, imageWidth) {
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
            widget.model,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 180),
                height: 330,
                alignment: const Alignment(1.8, -1.1),
                child: const CountdownTimer(duration: 300),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 88.0),
                child: Align(
                  alignment: Alignment(1.30, 0),
                  child: InternetSpeedWidget(),
                ),
              ),
              const Align(
                alignment: Alignment(1.30, 0),
                child: PingWidget(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70),
                child: Align(
                  alignment: Alignment(1.18, 0),
                  child: EndSessionButton(), // Add your EndSessionButton here
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
