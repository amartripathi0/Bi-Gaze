import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassCard extends StatelessWidget {
  final Widget destinationPage;
  final String cardName;

  const GlassCard(
      {Key? key, required this.destinationPage, required this.cardName})
      : super(key: key);

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
      {Key? key,
      required this.destinationPage,
      required this.recordId,
      required this.dateOfProctor})
      : super(key: key);

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
