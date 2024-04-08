import 'package:bigaze/ui/page/analysis_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:simple_animated_button/vertical_fill_button.dart';

class RecordDetailsPage extends StatelessWidget {
  final ProctorModel record;

  const RecordDetailsPage({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Detailed Records'),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 110,
            ),
            Center(
              child: VerticalFillButton(
                onClick: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnalysisReportPage(
                        record: record,
                      ),
                    ),
                  );
                },
                fillingDuration: const Duration(milliseconds: 700),
                curve: Curves.ease,
                buttonWidth: 270,
                buttonHeight: 40,
                cornerRadius: 10,
                filledColor: const Color.fromARGB(128, 172, 118, 208),
                buttonDecoration:
                    const BoxDecoration(color: Colors.transparent),
                initialThickness: 5,
                alignment: Alignment.center,
                child: const Text(
                  '| Analysis and Reports |',
                  style: TextStyle(
                      color: Color.fromARGB(229, 255, 255, 255), fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Record ID: ${record.id}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 250, 156, 122)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Date: ${record.date}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 137, 193, 192)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Time: ${record.time}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 186, 186, 182)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Audio: ${record.audio}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 178, 175, 175)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Object: ${record.object}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 178, 175, 175)),
              ),
            ),
            // Add more fields as needed
          ],
        ),
      ),
    );
  }
}
