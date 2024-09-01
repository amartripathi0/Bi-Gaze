import 'package:bigaze/object_detection/object_detection_all.dart';
import 'package:bigaze/object_detection/od_mobilenet_v1.dart';
import 'package:bigaze/object_detection/od_ssd_mobilenet.dart';
import 'package:bigaze/object_detection/od_yolov2_tiny.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/proctor_page.dart';
import 'package:bigaze/ui/page/quiz_generator_page.dart';
import 'package:bigaze/widgets/aiquizcreatercard.dart';
import 'package:bigaze/widgets/studyessentialscard.dart';
import 'package:flutter/material.dart';

import 'package:bigaze/ui/page/profile_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:bigaze/widgets/coolcard.dart';
import 'package:bigaze/ui/page/audio_classifier_page.dart';
import '../../widgets/mainnotificationcard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final currentIndex = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CoolAppBar(),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      bottomNavigationBar: CoolBottomNavigationBar(
        currentIndex: _currentIndex, // Pass current index
        onTap: (index) => _onItemTapped(context, index), // Handle tap event
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 110,
              ),
              MainNotificationCard(
                destinationPage: ProctorPage(),
                cardTitle: "Upcoming Session",
                cardSubTitle: "Proctor session name",
                countdownDuration: Duration(minutes: 15),
              ),
              SizedBox.square(
                dimension: 20,
              ),
              StudyEsssentialsCard(
                destinationPage: ProctorPage(),
                cardName: "Study essentials card",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              AiQuizCreaterCard(
                destinationPage: QuizGeneratorPage(),
                cardTitle: "QuizΞrix",
                cardSubTitle: "AI Powered Quiz Generator",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: ProctorPage(),
                cardName: "P R O C T O R",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: ObjectDetectionAll(),
                cardName: "Object Detection All",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: OdSsdMobileNet(),
                cardName: "Object Detection SSD MobileNet",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: OdYolo(),
                cardName: "Object Detection Yolov2",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: OdMobileNetVone(),
                cardName: "Object Detection Mobile net v1",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              GlassCard(
                destinationPage: AudioClassifier(),
                cardName: "Audio Classifier",
              ),
              SizedBox.square(
                dimension: 20,
              ),
              // Add more cards as needed
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        // Navigate to the result page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
        break;
      case 2:
        // Navigate to the scanner page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        // Navigate to the profile page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }
}
