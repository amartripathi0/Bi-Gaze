import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:bigaze/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailPasswordSignup extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const EmailPasswordSignup({super.key});

  @override
  _EmailPasswordSignupState createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Futuristic background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.network(
                  "https://raw.githubusercontent.com/nayan1306/assets/main/mail.gif",
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(187, 197, 218, 255),
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        blurRadius:
                            5.0, // The higher the blurRadius, the softer the glow
                        color: Color.fromARGB(
                            255, 181, 236, 255), // Glow color (light blue)
                        offset: Offset(0, 0), // Glow direction (centered)
                      ),
                      Shadow(
                        blurRadius:
                            20.0, // Additional shadow for more intense glow
                        color: Color.fromARGB(255, 236, 250, 255),
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                controller: emailController,
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomPasswordTextField(
                controller: passwordController,
                hintText: 'Set your password',
                obscureText: true,
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onTap: signUpUser,
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
