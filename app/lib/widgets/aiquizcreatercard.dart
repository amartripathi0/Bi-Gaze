import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class AiQuizCreaterCard extends StatelessWidget {
  final Widget destinationPage;
  final String cardTitle;
  final String cardSubTitle;

  const AiQuizCreaterCard(
      {super.key,
      required this.destinationPage,
      required this.cardTitle,
      required this.cardSubTitle});

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
            const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
            const Color.fromARGB(226, 255, 254, 246).withOpacity(0.5),
            const Color.fromARGB(255, 255, 251, 175).withOpacity(0.5),
            const Color.fromARGB(255, 255, 249, 136).withOpacity(0.5),
          ],
        ),
        child: Row(
          children: [
            Image.asset('./assets/images/cool_stuff/91w1.gif'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: const TextStyle(
                      color: Color.fromARGB(172, 252, 251, 252), fontSize: 24),
                ),
                Text(
                  cardSubTitle,
                  style: const TextStyle(
                      color: Color.fromARGB(172, 178, 172, 179), fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
