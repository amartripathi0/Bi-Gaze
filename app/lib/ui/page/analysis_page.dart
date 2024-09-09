import 'dart:developer';

import 'package:bigaze/ui/page/charts/pi_chart_object.dart';
import 'package:bigaze/widgets/purpleglass.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/charts/pi_chart_audio.dart';

class AnalysisReportPage extends StatelessWidget {
  final ProctorModel record;

  const AnalysisReportPage({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    log(record.object.toString());
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'A N A L Y S I S',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pi Chart Audio
            PurpleGlassCard(
              child: PieChartAudio(
                record: record,
              ),
            ),
            // pi chart Object detection
            PurpleGlassCard(child: PieChartObject(record: record)),
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
