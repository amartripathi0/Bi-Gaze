import 'package:flutter/material.dart';
import 'package:dart_ping/dart_ping.dart';

class PingWidget extends StatefulWidget {
  const PingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PingWidgetState createState() => _PingWidgetState();
}

class _PingWidgetState extends State<PingWidget> {
  Stream<PingData>? _pingStream;

  @override
  void initState() {
    super.initState();
    _pingStream = Ping('google.com').stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PingData>(
      stream: _pingStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.response == null) {
          return const Text('No data available');
        } else {
          final pingData = snapshot.data!;
          if (pingData.error != null) {
            return Text('Ping error: ${pingData.error}');
          }
          return Transform.rotate(
            angle: 90 * 3.14159 / 180,
            child: Container(
              width: 110,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(40, 0, 0, 0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.network_ping_rounded, // Replace with a suitable icon
                    color: Color.fromARGB(176, 255, 255, 255),
                  ),
                  Text(
                    ' ${pingData.response!.time!.inMilliseconds} ms',
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
