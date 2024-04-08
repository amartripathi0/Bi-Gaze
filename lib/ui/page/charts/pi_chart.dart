import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  final ProctorModel record;
  const PieChartSample2({Key? key, required this.record}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  late ProctorModel record;

  @override
  void initState() {
    super.initState();
    record = widget.record; // Accessing the passed data
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = generateRandomColors(record.audio);

    return AspectRatio(
      aspectRatio: 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 42,
            color: Colors.transparent,
            child: const Center(
              child: Text(
                "Sounds classified",
                style: TextStyle(
                    color: Colors.white, fontSize: 20, letterSpacing: 5),
              ),
            ),
          ),
          AspectRatio(
            aspectRatio: 1.5,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 1.0,
                centerSpaceRadius: 40,
                sections: showingSections(record.audio, colors),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: ListView(
                children: showingIndicators(record.audio, colors),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      List<dynamic> audioData, List<Color> colors) {
    Map<String, double> categoryMap = {};

    // Calculate the total value for each category
    for (var item in audioData) {
      String category = item.keys.first;
      double value = item.values.first;
      categoryMap[category] = (categoryMap[category] ?? 0) + value;
    }

    // Calculate the total sum of all categories
    double total =
        categoryMap.values.reduce((value, element) => value + element);

    // Convert category values to percentages
    Map<String, double> percentages = {};
    categoryMap.forEach((category, value) {
      percentages[category] = value / total * 100;
    });

    // Generate PieChart sections based on percentages
    return percentages.entries.map((entry) {
      final isTouched = entry.key == touchedIndex.toString();
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [
        Shadow(color: Color.fromARGB(255, 27, 26, 26), blurRadius: 2)
      ];

      return PieChartSectionData(
        color: colors[percentages.keys.toList().indexOf(entry.key)],
        value: entry.value,
        title: '${entry.value.toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 234, 234, 234),
          shadows: shadows,
        ),
      );
    }).toList();
  }

  List<Widget> showingIndicators(List<dynamic> audioData, List<Color> colors) {
    Map<String, List<double>> categoryValues =
        {}; // Map to store category and its values
    List<Widget> indicators = [];

    // Collect category values
    for (var item in audioData) {
      String category = item.keys.first;
      double value = item.values.first;

      if (!categoryValues.containsKey(category)) {
        categoryValues[category] = []; // Initialize empty list for the category
      }
      categoryValues[category]!.add(value); // Add value to the category's list
    }

    // Calculate average values for each category
    Map<String, double> averageValues = {};
    categoryValues.forEach((category, values) {
      double sum = values.reduce((value, element) => value + element);
      averageValues[category] = sum / values.length;
    });

    // Generate corresponding Indicator widgets for categories sorted by average values
    List<String> sortedCategories = averageValues.keys.toList()
      ..sort((a, b) {
        return averageValues[a]!.compareTo(averageValues[b]!);
      });

    for (String category in sortedCategories) {
      indicators.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Indicator(
              color: colors[sortedCategories.indexOf(category)],
              text: category,
              isSquare: true,
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      );
    }

    return indicators;
  }

  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red value between 0 and 255
      random.nextInt(256), // Green value between 0 and 255
      random.nextInt(256), // Blue value between 0 and 255
      1.0, // Alpha value (opacity) - 1.0 for fully opaque
    );
  }

  List<Color> generateRandomColors(List<dynamic> audioData) {
    List<Color> colors = [];

    // ignore: unused_local_variable
    for (var item in audioData) {
      colors.add(getRandomColor());
    }

    return colors;
  }
}

// --------------------------------------------------------------------------------
// Utilities ======================================================================
// --------------------------------------------------------------------------------
class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
