// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'dart:async';

class MainNotificationCard extends StatefulWidget {
  final Widget destinationPage;
  final String cardTitle;
  final String cardSubTitle;
  final Duration countdownDuration; // Duration for the countdown timer

  const MainNotificationCard({
    super.key,
    required this.destinationPage,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.countdownDuration,
  });

  @override
  _MainNotificationCardState createState() => _MainNotificationCardState();
}

class _MainNotificationCardState extends State<MainNotificationCard> {
  late Timer _timer;
  late Duration _remainingTime;
  late double _progress;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.countdownDuration;
    _progress = 1.0; // 100% progress at start
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime -= const Duration(seconds: 1);
          _progress =
              _remainingTime.inSeconds / widget.countdownDuration.inSeconds;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.destinationPage),
        );
      },
      child: GlassmorphicContainer(
        width: 350,
        height: 150,
        borderRadius: 20,
        blur: 50,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(255, 209, 189, 255).withOpacity(0.5),
            const Color.fromARGB(255, 163, 64, 255).withOpacity(0.5),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    './assets/images/cool_stuff/XVo6.gif',
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cardTitle,
                        style: const TextStyle(
                          color: Color.fromARGB(172, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.cardSubTitle,
                        style: const TextStyle(
                          color: Color.fromARGB(172, 178, 172, 179),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Time remaining: ${formatDuration(_remainingTime)}",
                    style: const TextStyle(
                      color: Color.fromARGB(172, 178, 172, 179),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              LinearProgressIndicator(
                value: _progress,
                minHeight: 15,
                backgroundColor: Colors.grey.withAlpha(50),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 195, 255, 148),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
