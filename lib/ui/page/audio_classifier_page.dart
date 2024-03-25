import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import '../../helper/audio_classification_helper.dart';

class AudioClassifier extends StatefulWidget {
  const AudioClassifier({super.key});

  @override
  State<AudioClassifier> createState() => _AudioClassifierState();
}

class _AudioClassifierState extends State<AudioClassifier> {
  static const platform =
      MethodChannel('org.tensorflow.audio_classification/audio_record');

  // The YAMNet/classifier model used in this code example accepts data that
  // represent single-channel, or mono, audio clips recorded at 16kHz in 0.975
  // second clips (15600 samples).
  static const _sampleRate = 16000; // 16kHz
  static const _expectAudioLength = 975; // milliseconds
  final int _requiredInputBuffer =
      (16000 * (_expectAudioLength / 1000)).toInt();
  late AudioClassificationHelper _helper;
  List<MapEntry<String, double>> _classification = List.empty();
  final List<Color> _primaryProgressColorList = [
    const Color(0xFFF44336),
    const Color(0xFFE91E63),
    const Color(0xFF9C27B0),
    const Color(0xFF3F51B5),
    const Color(0xFF2196F3),
    const Color(0xFF00BCD4),
    const Color(0xFF009688),
    const Color(0xFF4CAF50),
    const Color(0xFFFFEB3B),
    const Color(0xFFFFC107),
    const Color(0xFFFF9800)
  ];
  final List<Color> _backgroundProgressColorList = [
    const Color(0x44F44336),
    const Color(0x44E91E63),
    const Color(0x449C27B0),
    const Color(0x443F51B5),
    const Color(0x442196F3),
    const Color(0x4400BCD4),
    const Color(0x44009688),
    const Color(0x444CAF50),
    const Color(0x44FFEB3B),
    const Color(0x44FFC107),
    const Color(0x44FF9800)
  ];
  var _showError = false;

  void _startRecorder() {
    try {
      platform.invokeMethod('startRecord');
    } on PlatformException catch (e) {
      log("Failed to start record: '${e.message}'.");
    }
  }

  Future<bool> _requestPermission() async {
    try {
      return await platform.invokeMethod('requestPermissionAndCreateRecorder', {
        "sampleRate": _sampleRate,
        "requiredInputBuffer": _requiredInputBuffer
      });
    } on Exception catch (e) {
      log("Failed to create recorder: '${e.toString()}'.");
      return false;
    }
  }

  Future<Float32List> _getAudioFloatArray() async {
    var audioFloatArray = Float32List(0);
    try {
      final Float32List result =
          await platform.invokeMethod('getAudioFloatArray');
      audioFloatArray = result;
    } on PlatformException catch (e) {
      log("Failed to get audio array: '${e.message}'.");
    }
    return audioFloatArray;
  }

  Future<void> _closeRecorder() async {
    try {
      await platform.invokeMethod('closeRecorder');
      _helper.closeInterpreter();
    } on PlatformException {
      log("Failed to close recorder.");
    }
  }

  @override
  initState() {
    _initRecorder();
    super.initState();
  }

  Future<void> _initRecorder() async {
    _helper = AudioClassificationHelper();
    await _helper.initHelper();
    bool success = await _requestPermission();
    if (success) {
      _startRecorder();

      Timer.periodic(const Duration(milliseconds: _expectAudioLength), (timer) {
        // classify here
        _runInference();
      });
    } else {
      // show error here
      setState(() {
        _showError = true;
      });
    }
  }

  // Future<void> _runInference() async {
  //   Float32List inputArray = await _getAudioFloatArray();
  //   final result =
  //       await _helper.inference(inputArray.sublist(0, _requiredInputBuffer));
  //   setState(() {
  //     // take top 20 classification

  //     _classification = (result.entries.toList()
  //           ..sort(
  //             (a, b) => a.value.compareTo(b.value),
  //           ))
  //         .reversed
  //         .take(20)
  //         .toList();
  //   });

  //   // log(_classification.first.key);
  //   // log(DateTime.now().toString());
  // }

  Future<void> _runInference() async {
    Float32List inputArray = await _getAudioFloatArray();
    if (inputArray.length >= _requiredInputBuffer) {
      final result =
          await _helper.inference(inputArray.sublist(0, _requiredInputBuffer));
      setState(() {
        _classification = (result.entries.toList()
              ..sort(
                (a, b) => a.value.compareTo(b.value),
              ))
            .reversed
            .take(20)
            .toList();
      });
    } else {
      log("Input array length is less than required buffer length.");
    }
  }

  @override
  void dispose() {
    _closeRecorder();
    super.dispose();
  }

  Future<void> _closeRecorder() async {
    try {
      await platform.invokeMethod('closeRecorder');
      _helper.closeInterpreter();
    } on PlatformException {
      log("Failed to close recorder.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CommonAppBar(
        title: "Test Page",
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_showError) {
      return const Center(
        child: Text(
          "Audio recording permission required for audio classification",
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _classification.length,
        itemBuilder: (context, index) {
          final item = _classification[index];
          return Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  item.key,
                  style: const TextStyle(color: Colors.white60),
                ),
              ),
              Flexible(
                  child: LinearProgressIndicator(
                backgroundColor: _backgroundProgressColorList[
                    index % _backgroundProgressColorList.length],
                color: _primaryProgressColorList[
                    index % _primaryProgressColorList.length],
                value: item.value,
                minHeight: 20,
              ))
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      );
    }
  }
}
