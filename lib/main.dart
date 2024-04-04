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
        title: 'Flutter Demo',
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: 'assets/images/AppIcons/android/mipmap-xxxhdpi/bigaze.png',
            splashIconSize: 450,
            nextScreen: const MyHomePage(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0)));
  }
}
