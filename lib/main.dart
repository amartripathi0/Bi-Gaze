import 'dart:developer';

import 'package:bigaze/firebase_options.dart';
import 'package:bigaze/helper/boxes.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'ui/page/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bigaze/ui/theme/theme.dart';
import './provider/detections_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  log('Initializing Hive...');
  await Hive.initFlutter();
  Hive.registerAdapter(ProctorModelAdapter());
  log('Hive initialized.');

  try {
    if (Firebase.apps.isNotEmpty) {
      await Firebase.apps.first.delete();
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    log('Error initializing Firebase: $e');
  }

  log('Opening Hive box...');
  boxProctor = await Hive.openBox('proctorBox');
  log('Hive box opened.');

  final outputProvider = OutputProvider();

  runApp(
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
        duration: 500,
        splash: const SplashContent(), // Use custom widget for splashq
        splashIconSize: 550,
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
          './assets/images/cool_stuff/7RMn.gif',
          width: 500,
          height: 500,
        ),
      ],
    );
  }
}
