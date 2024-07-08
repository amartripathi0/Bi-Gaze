import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassCard extends StatelessWidget {
  final Widget destinationPage;
  final String cardName;

  const GlassCard(
      {super.key, required this.destinationPage, required this.cardName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: GlassmorphicContainer(
        width: 350,
        height: 150,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        child: Text(
          cardName,
          style: const TextStyle(
              color: Color.fromARGB(172, 178, 172, 179), fontSize: 20),
        ),
      ),
    );
  }
}

class GlassListTile extends StatelessWidget {
  final Widget destinationPage;
  final String recordId;
  final String dateOfProctor;

  const GlassListTile(
      {super.key,
      required this.destinationPage,
      required this.recordId,
      required this.dateOfProctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: GlassmorphicContainer(
        width: 350,
        height: 100,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Exam Analysis",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(223, 220, 220, 220), fontSize: 20),
            ),
            Text(
              recordId,
              style: const TextStyle(
                  color: Color.fromARGB(172, 178, 172, 179), fontSize: 12),
            ),
            Text(
              dateOfProctor,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromARGB(172, 237, 230, 209), fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerGlassCard extends StatelessWidget {
  final Widget destinationPage;
  final String cardName;
  final IconData cardIcon; // Changed type to IconData

  const ScannerGlassCard({
    super.key, // Add Key parameter for proper widget identification
    required this.destinationPage,
    required this.cardName,
    required this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: GlassmorphicContainer(
        width: 280,
        height: 100,
        borderRadius: 20,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.1),
            const Color(0xFFFFFFFF).withOpacity(0.05),
          ],
          stops: const [
            0.1,
            1,
          ],
        ),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 20),
              Icon(
                cardIcon, // Using Icon widget with IconData
                color: const Color.fromARGB(172, 178, 172, 179),
                size: 50,
              ),
              const SizedBox(width: 10),
              Text(
                cardName,
                style: const TextStyle(
                  color: Color.fromARGB(172, 178, 172, 179),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
