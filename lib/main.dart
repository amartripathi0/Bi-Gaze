import 'package:bigaze/helper/boxes.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'ui/page/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bigaze/ui/theme/theme.dart';
import './provider/detections_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(ProctorModelAdapter());

  // Open the Hive box
  boxProctor = await Hive.openBox('proctorBox');

  // Create an instance of OutputProvider
  final outputProvider = OutputProvider();

  runApp(
    // Wrap your app with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (_) => outputProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiG∆ZE',
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 2000,
        splash: const SplashContent(), // Use custom widget for splashq
        splashIconSize: 450,
        nextScreen: const MyHomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png',
          width: 250,
          height: 250,
        ),
        const SizedBox(height: 20),
        const Text(
          '  ',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 245, 214),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        // const CircularProgressIndicator(
        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        // ),
      ],
    );
  }
}
