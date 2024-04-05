import 'package:flutter/material.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';

class RecordDetailsPage extends StatelessWidget {
  final ProctorModel record;

  const RecordDetailsPage({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Detailed Records'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Record ID: ${record.id}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 250, 156, 122)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
