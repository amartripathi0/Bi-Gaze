import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({super.key});

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  bool isShowingMainData = true;

  void togglechartdata() {
    setState(() {
      isShowingMainData = !isShowingMainData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(103, 43, 43, 43),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: _LineChart(isShowingMainData: isShowingMainData),
                ),
              ],
            ),
            Positioned(
              top: -10.0, // Adjust the top position as needed
              right: -5.0, // Adjust the right position as needed
              child: IconButton(
                onPressed: togglechartdata,
                icon: const Icon(Icons.analytics_outlined),
              ),
            ),
          ],
        ));
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      isShowingMainData ? _sampleData1() : _sampleData2(),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData _sampleData1() => LineChartData(
        lineTouchData: _lineTouchData1(),
        gridData: _gridData(),
        titlesData: _titlesData1(),
        borderData: _borderData(),
        lineBarsData: _lineBarsData1(),
        minX: 0,
        maxX: 14,
        maxY: 6,
        minY: 0,
      );

  LineChartData _sampleData2() => LineChartData(
        lineTouchData: _lineTouchData2(),
        gridData: _gridData(),
        titlesData: _titlesData2(),
        borderData: _borderData(),
        lineBarsData: _lineBarsData2(),
        minX: 0,
        maxX: 14,
        maxY: 8,
        minY: 0,
      );

  LineTouchData _lineTouchData1() => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) =>
              const Color.fromARGB(255, 96, 125, 139).withOpacity(0.8),
        ),
      );

  LineTouchData _lineTouchData2() => const LineTouchData(enabled: false);

  FlTitlesData _titlesData1() => FlTitlesData(
        bottomTitles: _bottomTitles(),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: _leftTitles(),
      );

  FlTitlesData _titlesData2() => FlTitlesData(
        bottomTitles: _bottomTitles(),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: _leftTitles(),
      );

  AxisTitles _bottomTitles() => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          interval: 1,
          getTitlesWidget: (value, meta) => _bottomTitleWidgets(value),
        ),
      );

  Widget _bottomTitleWidgets(double value) {
    const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Color.fromARGB(255, 106, 106, 106));
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('SEPT', style: style);
        break;
      case 7:
        text = const Text('OCT', style: style);
        break;
      case 12:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(axisSide: AxisSide.bottom, space: 10, child: text);
  }

  AxisTitles _leftTitles() => AxisTitles(
        sideTitles: SideTitles(
          getTitlesWidget: (value, meta) => _leftTitleWidgets(value),
          showTitles: true,
          interval: 1,
          reservedSize: 30,
        ),
      );

  Widget _leftTitleWidgets(double value) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: Color.fromARGB(255, 131, 131, 131),
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '5m';
        break;
      case 5:
        text = '6m';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  FlGridData _gridData() => const FlGridData(show: false);

  FlBorderData _borderData() => FlBorderData(
        show: true,
        border: const Border(
          bottom:
              BorderSide(color: Color.fromARGB(161, 255, 231, 231), width: 4),
          left: BorderSide(color: Color.fromARGB(161, 255, 231, 231)),
          right: BorderSide(color: Color.fromARGB(0, 0, 0, 0)),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  List<LineChartBarData> _lineBarsData1() => [
        _lineChartBarData1_1(),
        _lineChartBarData1_2(),
        _lineChartBarData1_3(),
      ];

  List<LineChartBarData> _lineBarsData2() => [
        _lineChartBarData2_1(),
        _lineChartBarData2_2(),
        _lineChartBarData2_3(),
      ];

  LineChartBarData _lineChartBarData1_1() => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 1.5),
          FlSpot(5, 1.4),
          FlSpot(7, 3.4),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData _lineChartBarData1_2() => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData _lineChartBarData1_3() => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        barWidth: 8,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 2.8),
          FlSpot(3, 1.9),
          FlSpot(6, 3),
          FlSpot(10, 1.3),
          FlSpot(13, 2.5),
        ],
      );

  LineChartBarData _lineChartBarData2_1() => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.green.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
      );

  LineChartBarData _lineChartBarData2_2() => LineChartBarData(
        isCurved: true,
        color: Colors.pink.withOpacity(0.5),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.pink.withOpacity(0.2),
        ),
        spots: const [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
      );

  LineChartBarData _lineChartBarData2_3() => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: Colors.cyan.withOpacity(0.5),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
      );
}
