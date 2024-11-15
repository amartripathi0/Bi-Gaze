import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:bigaze/utils/showOtpDialog.dart';
import 'package:bigaze/utils/showSnackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  // FOR EVERY FUNCTION HERE
  // POP THE ROUTE USING: Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);

  // GET USER DATA
  // using null check operator since this method should be called only
  // when the user is logged in
  User get user => _auth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  // OTHER WAYS (depends on use case):
  // Stream get authState => FirebaseAuth.instance.userChanges();
  // Stream get authState => FirebaseAuth.instance.idTokenChanges();
  // KNOW MORE ABOUT THEM HERE: https://firebase.flutter.dev/docs/auth/start#auth-state

  // EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // if you want to display your own custom error message
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
      showSnackBar(
          context, e.message!); // Displaying the usual firebase error message
    }
  }

  // EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!user.emailVerified) {
        await sendEmailVerification(context);
        // restrict access to certain things using provider
        // transition to another page instead of home screen
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }

  // GOOGLE SIGN IN

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Create a GoogleSignIn instance
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Start the sign-in process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the authentication details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in with the credential
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Check if the user is signed in successfully
        if (userCredential.user != null) {
          log('Google sign-in successful for user: ${userCredential.user?.email}');
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        } else {
          log('Google sign-in failed: user is null');
          showSnackBar(context, 'Google sign-in failed');
        }
      } else {
        log('Google sign-in canceled by user');
        showSnackBar(context, 'Google sign-in canceled');
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      log('Google sign-in error: ${e.message}');
    } catch (e) {
      showSnackBar(context, 'An unexpected error occurred');
      log('Google sign-in unexpected error: $e');
    }
  }

  // Future<void> signInWithGoogle(BuildContext context) async {
  //   try {
  //     if (kIsWeb) {
  //       GoogleAuthProvider googleProvider = GoogleAuthProvider();
  //       googleProvider
  //           .addScope('https://www.googleapis.com/auth/contacts.readonly');
  //       await _auth.signInWithPopup(googleProvider);
  //     } else {
  //       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //       final GoogleSignInAuthentication? googleAuth =
  //           await googleUser?.authentication;

  //       if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
  //         final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth?.accessToken,
  //           idToken: googleAuth?.idToken,
  //         );
  //         UserCredential userCredential =
  //             await _auth.signInWithCredential(credential);

  //         // Check if the user is signed in successfully
  //         if (userCredential.user != null) {
  //           log('Google sign-in successful for user: ${userCredential.user?.email}');
  //           Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  //         } else {
  //           log('Google sign-in failed: user is null');
  //         }
  //       } else {
  //         log('Google sign-in failed: accessToken or idToken is null');
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     showSnackBar(context, e.message!);
  //     log('Google sign-in error: ${e.message}');
  //   }
  // }

  // ANONYMOUS SIGN IN
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      // Attempt to sign in anonymously
      UserCredential userCredential = await _auth.signInAnonymously();

      // Check if the user is signed in successfully
      if (userCredential.user != null) {
        log('Anonymous sign-in successful');
        // Navigate to the home screen and remove all previous routes
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        log('Anonymous sign-in failed: user is null');
        showSnackBar(context, 'Anonymous sign-in failed');
      }
    } on FirebaseAuthException catch (e) {
      // Show the error message
      showSnackBar(context, e.message!);
      log('Anonymous sign-in error: ${e.message}');
    } catch (e) {
      // Handle any other errors
      showSnackBar(context, 'An unexpected error occurred');
      log('Anonymous sign-in unexpected error: $e');
    }
  }

  // FACEBOOK SIGN IN
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    if (kIsWeb) {
      // !!! Works only on web !!!
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);

      // Display Dialog Box To accept OTP
      showOTPDialog(
        codeController: codeController,
        context: context,
        onPressed: () async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: result.verificationId,
            smsCode: codeController.text.trim(),
          );

          // Sign in with the credential
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          Navigator.of(context).pop(); // Remove the dialog box

          if (userCredential.user != null) {
            // If sign-in is successful, navigate to home page
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          } else {
            showSnackBar(context, 'Phone sign-in failed');
          }
        },
      );
    } else {
      // FOR ANDROID, IOS
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        // Automatic handling of the SMS code
        verificationCompleted: (PhoneAuthCredential credential) async {
          // !!! Works only on Android !!!
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          // If sign-in is successful, navigate to home page
          if (userCredential.user != null) {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          } else {
            showSnackBar(context, 'Phone sign-in failed');
          }
        },
        // Displays a message when verification fails
        verificationFailed: (e) {
          showSnackBar(context, e.message!);
        },
        // Displays a dialog box when OTP is sent
        codeSent: ((String verificationId, int? resendToken) async {
          showOTPDialog(
            codeController: codeController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim(),
              );

              // Sign in with the credential
              UserCredential userCredential =
                  await _auth.signInWithCredential(credential);

              Navigator.of(context).pop(); // Remove the dialog box

              // If sign-in is successful, navigate to home page
              if (userCredential.user != null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              } else {
                showSnackBar(context, 'Phone sign-in failed');
              }
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          // Auto-resolution timed out...
        },
      );
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
