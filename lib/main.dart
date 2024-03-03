import 'package:flutter/material.dart';
import 'ui/page/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bigaze/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
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
