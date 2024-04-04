import 'package:flutter/material.dart';

class OutputProvider extends ChangeNotifier {
  List<Map<String, dynamic>> audioOutput = [];
  List<Map<String, dynamic>> objectOutput = [];

  // Method to update the output data
  void updateObjectOutput(
    String output, {
    required List<Map<String, dynamic>> object,
  }) {
    objectOutput = object;
    notifyListeners();
  }

  // Method to update the output data
  void updateAudioOutput(
    String output, {
    required List<Map<String, dynamic>> audio,
  }) {
    audioOutput = audio;

    notifyListeners();
  }
}
