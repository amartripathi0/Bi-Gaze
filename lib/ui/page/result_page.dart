// ignore_for_file: deprecated_member_use, avoid_print

import 'package:bigaze/helper/boxes.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/model/proctor_model.dart'; // Import your ProctorModel class

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the home page when the back button is pressed
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return false; // Prevent the default back button behavior
      },
      child: Scaffold(
        floatingActionButton: const ClearRecordsButton(),
        appBar: const CommonAppBar(
          title: "Result",
        ),
        body: _buildResultsList(),
      ),
    );
  }

  Widget _buildResultsList() {
    if (boxProctor.isEmpty) {
      return const Center(child: Text('No records found'));
    } else {
      return ListView.builder(
        itemCount: boxProctor.length,
        itemBuilder: (context, index) {
          final record = boxProctor.getAt(index)! as ProctorModel;
          // log(record.id.toString());
          return ListTile(
            title: Text('Record ID: ${record.id}'),
            subtitle: Column(
              children: [
                Text('Time: ${record.time}'),
                Text('Audio: ${record.audio}'),
                Text('Object: ${record.object}'),
              ],
            ),
            // Display other record details as needed
          );
        },
      );
    }
  }
}

class ClearRecordsButton extends StatelessWidget {
  const ClearRecordsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        try {
          boxProctor.clear();
          print('All records cleared');
        } catch (e) {
          print('Error clearing records: $e');
          // Handle error here, such as showing an error message to the user
        }
      },
      tooltip: 'Clear Records',
      child: const Icon(Icons.clear),
    );
  }
}
