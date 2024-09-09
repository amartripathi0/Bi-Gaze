// ignore_for_file: deprecated_member_use
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/ui/page/scanner_screens/camera_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/document_scanner_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/gallery_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/history_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/id_scanner_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/pdf_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/qr_scanner_screen.dart';
import 'package:bigaze/ui/page/scanner_screens/recent_screen.dart';
import 'package:bigaze/widgets/coolcard.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  int _currentIndex = 2;

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
        Navigator.pushReplacement(
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
        appBar: const CommonAppBar(
          title: "Scanner",
        ),
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex, // Pass current index
          onTap: _onItemTapped, // Handle tap event
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScannerGlassTile(
                        destinationPage: HistoryScreen(),
                        cardName: "History",
                        cardIcon: Icons.history),
                    ScannerGlassTile(
                        destinationPage: RecentScreen(),
                        cardName: "Recent",
                        cardIcon: Icons.recent_actors_outlined),
                    ScannerGlassTile(
                        destinationPage: PdfScreen(),
                        cardName: "PDF",
                        cardIcon: Icons.picture_as_pdf)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ScannerGlassTile(
                        destinationPage: GalleryScreen(),
                        cardName: "Gallery",
                        cardIcon: Icons.photo_size_select_actual_rounded),
                    ScannerGlassTile(
                        destinationPage: CameraScreen(),
                        cardName: "Camera",
                        cardIcon: Icons.camera),
                    ScannerGlassTile(
                        destinationPage: MyHomePage(),
                        cardName: "Folder",
                        cardIcon: Icons.folder)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ScannerGlassCard(
                  destinationPage: QRScannerPage(),
                  cardName: 'QR scanner',
                  cardIcon: Icons.qr_code_scanner_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                ScannerGlassCard(
                  destinationPage: DocumentScannerScreen(),
                  cardName: 'Document Scanner',
                  cardIcon: Icons.document_scanner_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                ScannerGlassCard(
                  destinationPage: IdScannerScreen(),
                  cardName: 'ID scanner',
                  cardIcon: Icons.verified_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
