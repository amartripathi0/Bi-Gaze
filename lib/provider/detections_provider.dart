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
    List<MapEntry<String, double>> output, {
    required List<MapEntry<String, double>> audio,
  }) {
    // Convert List<MapEntry<String, double>> to List<Map<String, dynamic>>
    audioOutput = audio.map((entry) => {entry.key: entry.value}).toList();

    // Notify listeners that the audio output has been updated
    notifyListeners();
  }
}
