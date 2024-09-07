import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'dart:math';

class CustomHeatMap extends StatelessWidget {
  const CustomHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    // Initialize Random
    final Random random = Random();

    // Generate random data for the previous 101 days
    final Map<DateTime, int> heatMapData = {
      for (int i = 0; i < 101; i++)
        DateTime(2024, 9, 7).subtract(Duration(days: i)):
            random.nextInt(14) + 1,
    };

    return HeatMap(
      datasets: heatMapData,
      colorMode: ColorMode.opacity,
      textColor: Colors.white60,
      startDate: DateTime.now().subtract(const Duration(days: 70)),
      showText: false,
      scrollable: true,
      colorsets: const {
        1: Color(0xFF8e44ad), // Dark lavender
        3: Color(0xFF6c3483), // Deep violet
        5: Color(0xFF5b2c6f), // Medium dark purple
        7: Color(0xFF4a235a), // Dark calming purple
        9: Color(0xFF3d1e50), // Rich dark purple
        11: Color(0xFF2e1432), // Deeper violet
        13: Color(0xFF1d0e23), // Almost black purple
      },
      onClick: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
            value.toString(),
            style: const TextStyle(color: Colors.white70),
          )),
        );
      },
    );
  }
}
