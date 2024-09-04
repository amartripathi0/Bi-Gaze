import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/ui/page/login_signup_pages/login_email_password_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/phone_screen.dart';
import 'package:bigaze/ui/page/login_signup_pages/signup_email_password_screen.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, EmailPasswordSignup.routeName);
                },
                text: 'Sign Up',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, EmailPasswordLogin.routeName);
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, PhoneScreen.routeName);
                  },
                  text: 'Phone Sign In'),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                },
                text: 'Google Sign In',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () {
                  context
                      .read<FirebaseAuthMethods>()
                      .signInAnonymously(context);
                },
                text: 'Anonymous Sign In',
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
