import 'dart:developer';
import 'package:bigaze/services/firebase_auth_methods.dart';
import 'package:bigaze/ui/page/charts/line_chart.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:bigaze/ui/page/login_signup_pages/login_screen.dart';
import 'package:bigaze/widgets/clearcardplaceholder.dart';
import 'package:bigaze/widgets/custom_button.dart';
import 'package:bigaze/widgets/heatmap.dart';
import 'package:bigaze/widgets/profilecard.dart';
import 'package:bigaze/widgets/profilecardplaceholder.dart';
import 'package:bigaze/widgets/profileproctorcard.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:bigaze/ui/page/result_page.dart';
import 'package:bigaze/ui/page/scanner_page.dart';
import 'package:animated_background/animated_background.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultsPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScannerPage()),
        );
        break;
      case 3:
        // Already on ProfilePage, do nothing
        break;
    }
  }

  Future<void> _createDefaultUserRecord(String userId) async {
    final user = context.read<FirebaseAuthMethods>().user;
    log('${user.displayName}');
    try {
      await FirebaseFirestore.instance.collection('userinfo').doc(userId).set({
        'name': user.displayName ?? "Full name",
        'uname': 'set_user_name',
        'email': user.email ??
            "user@example.com", // Initially empty, user can update it
        'dob': '05/09/2024', // Initially empty, user can update it
        'mobno': user.phoneNumber ??
            "+91 2508202423", // Initially empty, user can update it
        'nationality': '', // Initially empty, user can update it
        'imagePath': user.photoURL ??
            'https://raw.githubusercontent.com/nayan1306/assets/main/profile_demo.jpeg',
      });
      log("Default user record created for: $userId");
    } catch (error) {
      log("Error creating user record: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: const CommonAppBar(
          title: "Profile",
        ),
        bottomNavigationBar: CoolBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('userinfo')
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              log("Error fetching user data: ${snapshot.error}");
              return const Center(child: Text("Error fetching data"));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              log("No data found for user: ${user.uid}. Creating new record...");
              _createDefaultUserRecord(user.uid); // Create default record
              return const Center(child: Text("Creating user record..."));
            }

            final data = snapshot.data!;
            final imagePath = data['imagePath'] ??
                'assets/images/test_assets/profile_demo.jpeg';
            final name = data['name'] ?? 'Vikaṭa Bālakaḥ';
            final email = data['email'] ?? user.email!;

            return AnimatedBackground(
              behaviour: SpaceBehaviour(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
              vsync: this,
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ProfileCard(
                          imagePath: imagePath,
                          name: name,
                          userId: user.uid,
                          additionalInfo: email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ClearCardPlaceholder(
                          child: Text(
                            "Growth Analysis",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const ClearCardPlaceholder(
                          child: SizedBox(
                            height: 200,
                            child: LineChartWidget(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // palce a heatmap
                        const ClearCardPlaceholder(
                          child: Text(
                            "Consistency counter",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const ClearCardPlaceholder(child: CustomHeatMap()),
                        const SizedBox(
                          height: 20,
                        ),

                        // proctor session stats
                        const ClearCardPlaceholder(
                          child: Text(
                            "Proctor stats",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const ClearCardPlaceholder(
                          child: ExamStatisticsWidget(
                            proctoredSessions: 65,
                            highestScore: 92.19,
                            completedExams: 11,
                            pendingExams: 0,
                            mostRecentExamScore: 100,
                            leaderboardRank: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomAlertButton(
                              onTap: () async {
                                try {
                                  await context
                                      .read<FirebaseAuthMethods>()
                                      .signOut(context);
                                  // Use pushReplacement to ensure the screen is replaced
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Failed to sign out: $e')),
                                  );
                                }
                              },
                              text: 'Sign Out',
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomAlertButton(
                              onTap: () async {
                                try {
                                  // Delete account and navigate to login screen
                                  await context
                                      .read<FirebaseAuthMethods>()
                                      .deleteAccount(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Failed to delete account: $e')),
                                  );
                                }
                              },
                              text: 'Delete Account',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
