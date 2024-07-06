import 'package:flutter/material.dart';
import 'package:internet_speed_meter/internet_speed_meter.dart';

class InternetSpeedWidget extends StatefulWidget {
  const InternetSpeedWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InternetSpeedWidgetState createState() => _InternetSpeedWidgetState();
}

class _InternetSpeedWidgetState extends State<InternetSpeedWidget> {
  final InternetSpeedMeter _internetSpeedMeterPlugin = InternetSpeedMeter();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _internetSpeedMeterPlugin.getCurrentInternetSpeed(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          return Transform.rotate(
            angle: 90 * 3.14159 / 180,
            child: Container(
              // height: 110,
              width: 110,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(20), // Adjust the radius as needed
                color: const Color.fromARGB(40, 0, 0, 0), // Background color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.signal_cellular_alt_rounded,
                    color: Color.fromARGB(176, 255, 255, 255),
                  ),
                  Text(
                    ' ${snapshot.data}',
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(176, 255, 255, 255)),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
