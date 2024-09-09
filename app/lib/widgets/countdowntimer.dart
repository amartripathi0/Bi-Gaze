import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimer extends StatefulWidget {
  final int duration;

  const CountdownTimer({super.key, required this.duration});

  @override
  // ignore: library_private_types_in_public_api
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late int _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration * 1000; // Convert seconds to milliseconds
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime -= 10; // Decrease by 10 milliseconds
        } else {
          _timer.cancel(); // Cancel the timer when countdown completes
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 90 * 3.14159 / 180, // Rotate child by 90 degrees (clockwise)
      child: Container(
        width: 180,
        height: 30,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20), // Adjust the radius as needed
          color: const Color.fromARGB(40, 0, 0, 0), // Background color
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timer_outlined, // Replace with a suitable icon
                color: Color.fromARGB(176, 255, 255, 255),
              ),
              Text(
                "  ${_formatDuration(_remainingTime)}",
                style: const TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 193, 193, 193)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(int milliseconds) {
    int seconds = (milliseconds / 1000).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String millisecondsStr = (milliseconds % 1000).toString().padLeft(3, '0');

    return '$hoursStr:$minutesStr:$secondsStr.$millisecondsStr';
  }
}
