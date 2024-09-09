import 'package:bigaze/widgets/neonsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'dart:math';

class CustomHeatMap extends StatelessWidget {
  const CustomHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    print(currentDate);

    // Initialize Random
    final Random random = Random();

    // Generate random data for the previous 101 days
    final Map<DateTime, int> heatMapData = {
      for (int i = 0; i < 101; i++)
        currentDate.subtract(Duration(days: i)): random.nextInt(14) + 1,
    };

    return HeatMap(
      datasets: heatMapData,
      colorMode: ColorMode.opacity,
      textColor: Colors.white60,
      // startDate: DateTime.now().subtract(const Duration(days: 70)),
      defaultColor: const Color.fromARGB(33, 92, 92, 92),
      endDate: currentDate,
      showText: false,
      scrollable: true,
      colorsets: const {
        1: Color.fromARGB(255, 237, 224, 255), // Light lavender
        3: Color.fromARGB(255, 221, 200, 255), // Soft violet
        5: Color.fromARGB(255, 208, 186, 255), // Light purple
        7: Color.fromARGB(255, 191, 146, 255), // Gentle purple
        9: Color.fromARGB(255, 162, 117, 255), // Light lilac
        11: Color.fromARGB(255, 139, 96, 255), // Pastel purple
        13: Color.fromARGB(255, 96, 69, 183), // Faint purple
      },
      onClick: (value) {
        ScaffoldMessenger.of(context).showSnackBar(
          neonSnackBar(
            value.toString(),
          ),
        );
      },
    );
  }
}
