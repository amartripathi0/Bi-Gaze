// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:bigaze/helper/boxes.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/ui/page/records_detailed.dart';

import '../../widgets/coolcard.dart';
import '../theme/color/alertcolors.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int _currentIndex = 1;
  bool _isAscending = true; // Variable to toggle sorting order
  bool _sortByTime = false; // Variable to toggle sorting by date or time

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation based on index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        // Do nothing if already on ResultsPage
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      // Add cases for other indexes as needed
    }
  }

  void _toggleSortingOrder() {
    setState(() {
      _isAscending = !_isAscending; // Toggle between ascending and descending
    });
  }

  void _toggleSortingCriteria() {
    setState(() {
      _sortByTime = !_sortByTime; // Toggle between sorting by time or date
    });
  }

  Future<bool> _onWillPop() async {
    // Navigate to the home page when the back button is pressed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
    return false; // Prevent the default back button behavior
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        appBar: ResultAppBar(
          title: "Analysis",
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 30),
              icon: const Icon(
                Icons.search,
                color: Colors.white70,
              ),
              onPressed: () {
                showSearch(context: context, delegate: RecordSearchDelegate());
              },
              tooltip: 'Search',
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.sort_by_alpha,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 5), // Adjust spacing as needed
                    Switch(
                      value: _isAscending,
                      onChanged: (value) {
                        _toggleSortingOrder(); // Toggle sorting order on switch change
                      },
                      activeColor: Colors.greenAccent,
                      inactiveThumbColor:
                          const Color.fromARGB(255, 89, 50, 128),
                    ),
                    const SizedBox(width: 10), // Adjust spacing as needed
                    const Icon(
                      Icons.timer_sharp,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 5),
                    Switch(
                      value: _sortByTime,
                      onChanged: (value) {
                        _toggleSortingCriteria(); // Toggle sorting criteria (time/date)
                      },
                      activeColor: Colors.greenAccent,
                      inactiveThumbColor:
                          const Color.fromARGB(255, 89, 50, 128),
                    ),
                  ],
                ),
                const ClearRecordsButton(),
              ],
            ),
            Expanded(child: _buildResultsList(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsList(BuildContext context) {
    List<ProctorModel> records =
        boxProctor.values.cast<ProctorModel>().toList();

    // Sort records based on _isAscending and _sortByTime flags
    if (_sortByTime) {
      records.sort((a, b) => _isAscending
          ? a.time[0].compareTo(b.time[0])
          : b.time[0].compareTo(a.time[0]));
    } else {
      records.sort((a, b) =>
          _isAscending ? a.date.compareTo(b.date) : b.date.compareTo(a.date));
    }

    if (records.isEmpty) {
      return const Center(child: Text('No records found'));
    } else {
      return ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return Center(
            child: Column(
              children: [
                GlassListTile(
                  recordId: 'Record ID: ${record.id}',
                  dateOfProctor:
                      'Date : ${record.date}  | Time : ${record.time[0]}',
                  destinationPage: RecordDetailsPage(record: record),
                ),
                const SizedBox(
                  height: 20,
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
  const ClearRecordsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Show confirmation dialog
        showDialog(
          barrierColor: const Color.fromARGB(51, 199, 84, 84),
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(207, 0, 0, 0),
              shadowColor: const Color.fromARGB(255, 176, 168, 168),
              title: const Text(
                "⚠️ Clear all records",
                style: TextStyle(color: Colors.white70),
              ),
              content: const Text(
                  "Once cleared, records will vanish faster than a cake at a birthday party full of hungry toddlers!",
                  style: TextStyle(color: Colors.white70)),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text("❌ Cancel",
                      style:
                          TextStyle(color: Color.fromARGB(179, 255, 83, 83))),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      boxProctor.clear();
                      log('All records cleared');
                      // Rebuild the UI after clearing records
                      // ignore: invalid_use_of_protected_member
                      (context as Element).reassemble();
                      Navigator.of(context).pop(); // Close dialog
                    } catch (e) {
                      log('Error clearing records: $e');
                      // Handle error here, such as showing an error message to the user
                      Navigator.of(context).pop(); // Close dialog on error
                    }
                  },
                  child: const Text("✅ Clear",
                      style:
                          TextStyle(color: Color.fromARGB(228, 163, 255, 163))),
                ),
              ],
            );
          },
        );
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(85, 0, 0, 0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: AlertButtonColors.endsessioncolor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text(
        "Clear Records",
        style: TextStyle(color: Colors.white54, fontSize: 14),
      ),
    );
  }
}

class RecordSearchDelegate extends SearchDelegate<ProctorModel?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<ProctorModel> records =
        boxProctor.values.cast<ProctorModel>().toList();
    records = records
        .where((record) =>
            record.id.contains(query) || record.date.contains(query))
        .toList();

    if (records.isEmpty) {
      return const Center(child: Text('No records found'));
    } else {
      return ListView.builder(
        itemCount: records.length,
        itemBuilder: (context, index) {
          final record = records[index];
          return ListTile(
            title: Text('Record ID: ${record.id}'),
            subtitle: Text('Date: ${record.date} | Time: ${record.time[0]}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecordDetailsPage(record: record),
                ),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search for records by ID or Date'));
  }
}
