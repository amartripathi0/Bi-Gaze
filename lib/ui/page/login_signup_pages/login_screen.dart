import 'dart:developer';

import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/ui/page/login_signup_pages/login_email_password_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/phone_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/signup_email_password_screen.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:bigaze/widgets/custom_textfield.dart'; // Import for CustomTextField
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
    log("Login Successful");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cool_stuff/login.gif',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              // Login form section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Enter your email',
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Enter your password',
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      onTap: loginUser,
                      text: 'Login',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "First visit? Sign up here!",
                style: TextStyle(color: Colors.white38),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, EmailPasswordSignup.routeName);
                    },
                    imagePath: 'assets/images/cool_stuff/gmail.png',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    onTap: () {
                      Navigator.pushNamed(context, PhoneScreen.routeName);
                    },
                    imagePath: 'assets/images/cool_stuff/sms.png',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .signInWithGoogle(context);
                    },
                    imagePath: 'assets/images/cool_stuff/google.png',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomIconButton(
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .signInAnonymously(context);
                    },
                    imagePath: 'assets/images/cool_stuff/hacker.png',
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
