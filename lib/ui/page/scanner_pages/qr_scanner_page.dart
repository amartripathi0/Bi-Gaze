import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatelessWidget {
  const QRScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;
  bool isScanned = false;

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
            ],
          ),
          Positioned(
              top: 40, // Adjust top position as needed
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black54, // Background color
                child: const Text(
                  'Place your QR code in front of the camera',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }

  void startScanning() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.resumeCamera();
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isScanned) {
        setState(() {
          isScanned = true;
        });
        // Handle the scanned result here
        _handleScanResult(scanData.code);
        // Pause the QR scanner after scan
        controller.pauseCamera();
      }
    });
  }

  void _handleScanResult(String? scanResult) {
    if (scanResult != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor:
                Colors.transparent, // Transparent background for the dialog
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(
                    255, 181, 181, 181), // Dialog content background color
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Scan Result',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    scanResult,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Handle null case if needed
      print('Scanned result is null');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
