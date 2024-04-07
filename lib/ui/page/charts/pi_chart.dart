import 'dart:developer';
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
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
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
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(record.audio),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 28,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: showingIndicators(record.audio),
          // ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(List<dynamic> audioData) {
    Map<String, double> categoryMap = {};
    List<Color> colors = [];

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
    percentages.forEach((category, value) {
      colors.add(getRandomColor());
    });

    return percentages.entries.map((entry) {
      final isTouched = entry.key == touchedIndex.toString();
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: getRandomColor(),
        value: entry.value,
        title: '${entry.value.toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: shadows,
        ),
      );
    }).toList();
  }

  List<Widget> showingIndicators(List<dynamic> audioData) {
    Set<String> uniqueCategories = <String>{};
    List<Widget> indicators = [];

    // Collect unique categories
    for (var item in audioData) {
      String category = item.keys.first;
      uniqueCategories.add(category);
    }

    // Generate corresponding Indicator widgets for sorted unique categories
    List<String> sortedCategories = uniqueCategories.toList()..sort();
    for (String category in sortedCategories) {
      indicators.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Indicator(
              color: getRandomColor(),
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

  // List<PieChartSectionData> showingSections() {
  //   return List.generate(4, (i) {
  //     final isTouched = i == touchedIndex;
  //     final fontSize = isTouched ? 25.0 : 16.0;
  //     final radius = isTouched ? 60.0 : 50.0;
  //     const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
  //     switch (i) {
  //       case 0:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorBlue,
  //           value: 40,
  //           title: '40%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 1:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorYellow,
  //           value: 30,
  //           title: '30%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 2:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorPurple,
  //           value: 15,
  //           title: '15%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       case 3:
  //         return PieChartSectionData(
  //           color: AppColors.contentColorGreen,
  //           value: 15,
  //           title: '15%',
  //           radius: radius,
  //           titleStyle: TextStyle(
  //             fontSize: fontSize,
  //             fontWeight: FontWeight.bold,
  //             color: AppColors.mainTextColor1,
  //             shadows: shadows,
  //           ),
  //         );
  //       default:
  //         throw Error();
  //     }
  //   });
  // }
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
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
