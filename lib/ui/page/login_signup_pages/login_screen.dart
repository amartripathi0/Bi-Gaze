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
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, EmailPasswordLogin.routeName);
                    },
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(
                          context, EmailPasswordSignup.routeName);
                    },
                    text: 'SIGN UP',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // phone
                  CustomIconButton(
                    onTap: () {
                      Navigator.pushNamed(context, PhoneScreen.routeName);
                    },
                    imagePath: 'assets/images/cool_stuff/sms.png',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  //  google
                  CustomIconButton(
                    onTap: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .signInWithGoogle(context);
                    },
                    imagePath: 'assets/images/cool_stuff/google.png',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // anonymous
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
