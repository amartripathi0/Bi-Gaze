import 'dart:developer';
import 'package:bigaze/firebase_options.dart';
import 'package:bigaze/helper/boxes.dart';
import 'package:bigaze/model/proctor_model.dart';
import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/login_signup_pages/login_email_password_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/phone_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/signup_email_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bigaze/ui/theme/theme.dart';
import './provider/detections_provider.dart';
import './ui/page/login_signup_pages/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  log('Initializing Hive...');
  await Hive.initFlutter();
  Hive.registerAdapter(ProctorModelAdapter());
  log('Hive initialized.');

  log('Initializing Firebase...');
  await Firebase.initializeApp(
    name: 'bigaze',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  log('Firebase initialized.');

  log('Opening Hive box...');
  boxProctor = await Hive.openBox('proctorBox');
  log('Hive box opened.');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OutputProvider()),
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        StreamProvider<User?>(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'BiG∆ZE',
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          duration: 500,
          splash: const SplashContent(),
          splashIconSize: 550,
          nextScreen: const AuthWrapper(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        routes: {
          EmailPasswordSignup.routeName: (context) =>
              const EmailPasswordSignup(),
          EmailPasswordLogin.routeName: (context) => const EmailPasswordLogin(),
          PhoneScreen.routeName: (context) => const PhoneScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const MyHomePage();
      // return const HomeScreen();
    }
    return const LoginScreen();
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
