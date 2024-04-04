// ignore_for_file: deprecated_member_use, avoid_print

import 'package:bigaze/object_detection/od_ssd_mobilenet.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:bigaze/ui/page/home_page.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:simple_animated_button/horizontal_fill_button.dart';

class ProctorPage extends StatefulWidget {
  const ProctorPage({Key? key}) : super(key: key);

  @override
  State<ProctorPage> createState() => _ProctorPageState();
}

class _ProctorPageState extends State<ProctorPage> {
  // late Timer _timer; // Define a Timer variable
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navigate to the home page when the back button is pressed
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
          );
          return false; // Prevent the default back button behavior
        },
        child: Scaffold(
          appBar: const CommonAppBar(
            title: "P R O C T O R",
          ),
          body: Stack(
            children: [
              // Your other widgets
              Positioned(
                bottom: 280,
                left: 0,
                right: 0,
                top: 50,
                child: Container(
                  height: 500, // Adjust height as needed
                  width: 400, // Adjust width as needed
                  alignment: Alignment.center,
                  child: GlassContainer(
                    height: 500,
                    width: 350,
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 23, 22, 22).withOpacity(0.40),
                        const Color.fromARGB(255, 100, 65, 116)
                            .withOpacity(0.10)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.60),
                        Colors.white.withOpacity(0.10),
                        const Color.fromARGB(255, 157, 106, 188)
                            .withOpacity(0.05),
                        const Color.fromARGB(255, 144, 95, 165).withOpacity(0.6)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 0.39, 0.40, 1.0],
                    ),
                    blur: 15.0,
                    borderWidth: 1.5,
                    elevation: 3.0,
                    isFrostedGlass: false,
                    shadowColor:
                        const Color.fromARGB(255, 30, 29, 29).withOpacity(0.40),
                    alignment: Alignment.center,
                    frostedOpacity: 0.12,
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    child: const Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text(
                            'CONFIRMATION',
                            style: TextStyle(
                                color: Color.fromARGB(244, 233, 231, 231),
                                fontSize: 20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                '✅   Enshure you have set the environment as per the RULES.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '✅   You are ready to START the EXAM.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '✅   You agree to the Terms and Conditions of the exam.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '✅  You have a stable internet connection.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '✅  Make sure your device\'s camera and microphone are working properly.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '✅  Find a quiet and well-lit environment for the exam.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 25),
                              Text(
                                '🔺 Closing the app, pressing back button,changing the tab wil automatically TERMINATE the session.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '🔺 Contact technical support if you encounter any issues before starting the exam.',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 201, 199, 199),
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 5)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 200,
                left: 0,
                right: 0,
                child: HorizontalFillButton(
                  onClick: () async {
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OdSsdMobileNet(),
                      ),
                    );
                  },
                  fillingDuration: const Duration(milliseconds: 700),
                  curve: Curves.ease,
                  buttonWidth: 270,
                  buttonHeight: 40,
                  cornerRadius: 10,
                  filledColor: const Color.fromARGB(255, 160, 255, 162),
                  buttonDecoration:
                      const BoxDecoration(color: Colors.transparent),
                  initialThickness: 10,
                  alignment: Alignment.center,
                  child: const Text(
                    'Touch to Confirm',
                    style: TextStyle(color: Colors.white54, fontSize: 20),
                  ),
                ),
              ),
              // // Overlay ObjectDetectionPage
              // const SizedBox(
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: OdSsdMobileNet(),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
