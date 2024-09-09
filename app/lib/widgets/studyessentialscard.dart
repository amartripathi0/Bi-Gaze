import 'package:bigaze/ui/page/study_essentials/assignment_page.dart';
import 'package:bigaze/ui/page/study_essentials/custom_practice_page.dart';
import 'package:bigaze/ui/page/study_essentials/improvement_book_page.dart';
import 'package:bigaze/ui/page/study_essentials/study_planner_page.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class StudyEsssentialsCard extends StatelessWidget {
  final Widget destinationPage;
  final String cardName;

  const StudyEsssentialsCard(
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
        height: 300,
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
            const Color.fromARGB(255, 224, 250, 255).withOpacity(0.5),
            const Color.fromARGB(255, 156, 252, 255).withOpacity(0.8),
          ],
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              Image.asset(
                "./assets/images/cool_stuff/book.gif",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                cardName,
                style: const TextStyle(
                    color: Color.fromARGB(255, 178, 172, 179), fontSize: 24),
              ),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StudyGlassTile(
                  destinationPage: AssignmentPage(),
                  cardName: "Assignment",
                  cardIcon: Icons.school_sharp),
              SizedBox(
                height: 6,
              ),
              StudyGlassTile(
                  destinationPage: ImprovementBook(),
                  cardName: "Improvement Book",
                  cardIcon: Icons.chrome_reader_mode_outlined),
              SizedBox(
                height: 6,
              ),
              StudyGlassTile(
                  destinationPage: StudyPlanner(),
                  cardName: "Study Planner",
                  cardIcon: Icons.play_lesson_outlined),
              SizedBox(
                height: 6,
              ),
              StudyGlassTile(
                  destinationPage: CustomPractice(),
                  cardName: "Custom practice",
                  cardIcon: Icons.task),
            ],
          ),
        ]),
      ),
    );
  }
}

class StudyGlassTile extends StatelessWidget {
  final Widget destinationPage;
  final String cardName;
  final IconData cardIcon; // Changed type to IconData

  const StudyGlassTile({
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
        width: 300,
        height: 55,
        borderRadius: 10,
        blur: 20,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color.fromARGB(147, 52, 51, 51).withOpacity(0.2),
            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.05),
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
            const Color.fromARGB(255, 224, 250, 255).withOpacity(0.5),
            const Color.fromARGB(255, 215, 241, 255).withOpacity(0.6),
            const Color.fromARGB(255, 248, 253, 255).withOpacity(0.7),
            const Color.fromARGB(255, 156, 252, 255).withOpacity(0.5),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Icon(
              cardIcon, // Using Icon widget with IconData
              color: const Color.fromARGB(172, 178, 172, 179),
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              cardName,
              style: const TextStyle(
                color: Color.fromARGB(173, 255, 255, 255),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
