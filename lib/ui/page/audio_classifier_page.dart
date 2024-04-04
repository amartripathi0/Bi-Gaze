// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import '../../helper/audio_classification_helper.dart';
import '../../provider/detections_provider.dart';

class AudioClassifier extends StatefulWidget {
  const AudioClassifier({Key? key}) : super(key: key);

  @override
  State<AudioClassifier> createState() => _AudioClassifierState();
}

class _AudioClassifierState extends State<AudioClassifier> {
  late AudioClassificationHelper _helper;
  Timer? _timer;

  static const platform =
      MethodChannel('org.tensorflow.audio_classification/audio_record');

  static const _sampleRate = 16000;
  static const _expectAudioLength = 975;
  final int _requiredInputBuffer =
      (16000 * (_expectAudioLength / 1000)).toInt();
  List<MapEntry<String, double>> _classification = [];
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
  bool _isRecording = false;

  void _attachBackButtonListener() {
    // Add a listener for the back button
    RawKeyboard.instance.addListener(_handleKeyEvent);
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (event.runtimeType == RawKeyDownEvent) {
      // Check if the back key is pressed
      if (event.logicalKey == LogicalKeyboardKey.backspace ||
          event.logicalKey == LogicalKeyboardKey.browserBack) {
        if (_isRecording) {
          _closeRecorder(); // Stop the audio classifier when back button is pressed
        } else {
          Navigator.of(context).pop(); // Navigate back if not recording
        }
      }
    }
  }

  void _startRecorder() {
    try {
      platform.invokeMethod('startRecord');
      _isRecording = true;
    } on PlatformException catch (e) {
      log("Failed to start record: '${e.message}'.");
    }
  }

  Future<bool> _requestPermission() async {
    try {
      return await platform.invokeMethod(
        'requestPermissionAndCreateRecorder',
        {
          "sampleRate": _sampleRate,
          "requiredInputBuffer": _requiredInputBuffer
        },
      );
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

  void _closeRecorder() async {
    try {
      await platform.invokeMethod('closeRecorder');
      if (_isRecording) {
        _isRecording = false;
        _helper.closeInterpreter();
        log("Recorder closed");
      }
    } on PlatformException {
      log("Failed to close recorder.");
    }
  }

  @override
  void initState() {
    super.initState();
    _initRecorder();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _attachBackButtonListener();
    });
  }

  void _initRecorder() async {
    _helper = AudioClassificationHelper();
    await _helper.initHelper();
    bool success = await _requestPermission();
    if (success) {
      _startRecorder();

      _timer = Timer.periodic(const Duration(milliseconds: _expectAudioLength),
          (timer) {
        _runInference();
      });
    } else {
      setState(() {
        _showError = true;
      });
    }
  }

  Future<void> _runInference() async {
    Float32List inputArray = await _getAudioFloatArray();
    // log(inputArray.length.toString());

    // Check if the input array length is sufficient for inference
    if (inputArray.length >= _requiredInputBuffer) {
      final result =
          await _helper.inference(inputArray.sublist(0, _requiredInputBuffer));
      setState(() {
        _classification = (result.entries.toList()
              ..sort(
                (a, b) => a.value.compareTo(b.value),
              ))
            .reversed
            .take(10)
            .toList();
      });
    } else {
      log("Input array length is less than required buffer length.");
      // log(inputArray.length.toString());

      // Clear the classification list when input is insufficient
      setState(() {
        _classification.clear();
      });
    }
  }

  @override
  void dispose() {
    _closeRecorder();
    _timer?.cancel();
    RawKeyboard.instance.removeListener(_handleKeyEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _closeRecorder();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0),
        // appBar: const CommonAppBar(
        //   title: "Test Page",
        // ),
        body: _buildBody(),
      ),
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
          // log(_classification.first.toString());
          // -------|---------------------|----------------------------------|-----------------
          // log(data.toString());
          // log(_classification.toString());
          final output = _classification;
          final data = [_classification.first];
          log(data.toString());
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Provider.of<OutputProvider>(context, listen: false)
                .updateAudioOutput(output, audio: data);
          });

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
                ),
              )
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
