import 'package:flutter/material.dart';

class OutputProvider extends ChangeNotifier {
  List<Map<String, dynamic>> audioOutput = [];
  List<Map<String, dynamic>> objectOutput = [];

  // Method to update the output data
  void updateOutput({
    required List<Map<String, dynamic>> audio,
    required List<Map<String, dynamic>> object,
  }) {
    audioOutput = audio;
    objectOutput = object;
    notifyListeners();
  }
}
