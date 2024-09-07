import 'package:flutter/material.dart';

class ExamStatisticsWidget extends StatelessWidget {
  final int proctoredSessions;
  final double highestScore;

  const ExamStatisticsWidget({
    super.key,
    required this.proctoredSessions,
    required this.highestScore,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(1)),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(219, 255, 255, 255)),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(104, 103, 101, 101),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Proctored Sessions: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 166, 166, 166)),
                    ),
                    Text(
                      '$proctoredSessions',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 221, 218, 218)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Text(
                      'Highest Score: ',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 166, 166, 166)),
                    ),
                    Text(
                      '$highestScore',
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 221, 218, 218)),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
