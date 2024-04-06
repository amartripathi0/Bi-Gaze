// ignore_for_file: deprecated_member_use, avoid_print

import 'package:bigaze/helper/boxes.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:bigaze/widgets/coolcard.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/records_detailed.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResultsPage()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ScannerPage()));
        break;
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfilePage()));
        break;
      // Add cases for other indexes as needed
    }
  }

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
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        floatingActionButton: const SizedBox(
          width: 130, // Adjust the width as needed
          child: ClearRecordsButton(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: const CommonAppBar(
          title: "Result",
        ),
        body: _buildResultsList(context),
      ),
    );
  }

  Widget _buildResultsList(BuildContext context) {
    if (boxProctor.isEmpty) {
      return const Center(child: Text('No records found'));
    } else {
      return ListView.builder(
        itemCount: boxProctor.length,
        itemBuilder: (context, index) {
          final record = boxProctor.getAt(index)! as ProctorModel;
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                GlassListTile(
                  recordId: 'Record ID: ${record.id}',
                  dateOfProctor: 'Date : ${record.date}',
                  destinationPage: RecordDetailsPage(record: record),
                ),
              ],
            ),
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
      isExtended: true,
      backgroundColor: const Color.fromARGB(186, 175, 59, 59),
      child: const Padding(
        padding: EdgeInsets.all(3.0),
        child: Center(
          child: Row(
            children: [
              Icon(
                Icons.clear,
                color: Colors.black,
              ),
              Text(
                "Clear records",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
