import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(
              user.email!,
              style: const TextStyle(color: Colors.white),
            ),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(
              user.providerData[0].providerId,
              style: const TextStyle(color: Colors.white),
            ),
          if (user.phoneNumber != null)
            Text(
              user.phoneNumber!,
              style: const TextStyle(color: Colors.white),
            ),
          Text(
            user.uid,
            style: const TextStyle(color: Colors.white),
          ),
          if (!user.emailVerified && !user.isAnonymous)
            CustomButton(
              onTap: () {
                context
                    .read<FirebaseAuthMethods>()
                    .sendEmailVerification(context);
              },
              text: 'Verify Email',
            ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
            },
            text: 'Sign Out',
          ),
          CustomButton(
            onTap: () {
              context.read<FirebaseAuthMethods>().deleteAccount(context);
            },
            text: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
