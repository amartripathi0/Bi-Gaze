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

import '../theme/color/alertcolors.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  int _currentIndex = 1;
  final bool _isAscending = true;

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
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
        // floatingActionButton: const SizedBox(
        //   width: 130, // Adjust the width as needed
        //   child: ClearRecordsButton(),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: ResultAppBar(
          title: "Result",
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Switch(
                  value: false,
                  onChanged: null,
                  activeColor: Colors.greenAccent,
                  inactiveThumbColor: Color.fromARGB(255, 89, 50, 128),
                ),
                ClearRecordsButton(),
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

    // Sort records
    records.sort((a, b) =>
        _isAscending ? a.date.compareTo(b.date) : b.date.compareTo(a.date));

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
                  dateOfProctor: 'Date : ${record.date}',
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
        try {
          boxProctor.clear();
          print('All records cleared');
          // Rebuild the UI after clearing records
          // ignore: invalid_use_of_protected_member
          (context as Element).reassemble();
        } catch (e) {
          print('Error clearing records: $e');
          // Handle error here, such as showing an error message to the user
        }
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(85, 0, 0, 0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: const BorderSide(
              color: AlertButtonColors
                  .endsessioncolor, // Specify your border color here
              width: 2, // Specify the border width
            ),
            borderRadius:
                BorderRadius.circular(8), // Adjust the border radius as needed
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

  @override
  Widget buildSuggestions(BuildContext context) {
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

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.black, // Change primary color
      primaryIconTheme: theme.primaryIconTheme
          .copyWith(color: Colors.white), // Change icon color
      brightness: Brightness.dark, // Adjust brightness if needed
      textTheme: theme.textTheme.copyWith(
        headline6: const TextStyle(
          color: Color.fromARGB(255, 197, 197, 197),
          fontSize: 18,
        ), // Adjust text style
      ),
    );
  }
}
