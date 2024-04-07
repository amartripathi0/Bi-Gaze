import 'dart:developer';

import 'package:bigaze/widgets/purpleglass.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/charts/pi_chart.dart';

class AnalysisReportPage extends StatelessWidget {
  final ProctorModel record;

  const AnalysisReportPage({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(record.audio.toString());
    return Scaffold(
      appBar: const CommonAppBar(title: 'A N A L Y S I S'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PurpleGlassCard(
              child: PieChartSample2(
                record: record,
              ),
            ),
            // Pi Chart
            const PurpleGlassCard(
              child: Text("Line Chart"),
            ),
            const PurpleGlassCard(
              child: Text("Time Serires Chart"),
            ),

            const SizedBox(height: 20),
            // LineChartSample(record: record),
          ],
        ),
      ),
    );
  }
}
