import 'package:flutter/material.dart';

class ExamStatisticsWidget extends StatelessWidget {
  final int proctoredSessions;
  final double highestScore;
  final double mostRecentExamScore;
  final int leaderboardRank;
  final int completedExams;
  final int pendingExams;

  const ExamStatisticsWidget({
    super.key,
    required this.proctoredSessions,
    required this.highestScore,
    required this.mostRecentExamScore,
    required this.leaderboardRank,
    required this.completedExams,
    required this.pendingExams,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(
                  0, 128, 0, 128), // Light purple with 50% transparency
              Color.fromARGB(
                  0, 102, 51, 153), // Medium purple with 100% transparency
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatCard(
              title: 'Proctored Sessions',
              value: '$proctoredSessions',
              icon: Icons.settings_input_svideo_rounded,
              borderColor:
                  const Color.fromARGB(150, 153, 102, 204), // Purple border
              fillColor:
                  const Color.fromARGB(70, 153, 102, 204), // 70% transparency
            ),
            const SizedBox(height: 10),
            _buildStatCard(
              title: 'Highest Score',
              value: '$highestScore',
              icon: Icons.star,
              borderColor:
                  const Color.fromARGB(150, 136, 85, 255), // Purple border
              fillColor:
                  const Color.fromARGB(70, 136, 85, 255), // 70% transparency
            ),
            const SizedBox(height: 10),
            _buildStatCard(
              title: 'Completed Exams',
              value: '$completedExams',
              icon: Icons.check_circle,
              borderColor:
                  const Color.fromARGB(150, 108, 66, 222), // Purple border
              fillColor:
                  const Color.fromARGB(70, 108, 66, 222), // 70% transparency
            ),
            const SizedBox(height: 10),
            _buildStatCard(
              title: 'Pending Exams',
              value: '$pendingExams',
              icon: Icons.pending,
              borderColor:
                  const Color.fromARGB(150, 92, 51, 204), // Purple border
              fillColor:
                  const Color.fromARGB(70, 92, 51, 204), // 70% transparency
            ),
            const SizedBox(height: 10),
            _buildStatCard(
              title: 'Recent Exam Score',
              value: mostRecentExamScore.toStringAsFixed(1),
              icon: Icons.receipt,
              borderColor:
                  const Color.fromARGB(150, 79, 41, 153), // Purple border
              fillColor:
                  const Color.fromARGB(70, 79, 41, 153), // 70% transparency
            ),
            const SizedBox(height: 10),
            _buildStatCard(
              title: 'Rank ',
              value: '$leaderboardRank',
              icon: Icons.auto_graph_outlined,
              borderColor:
                  const Color.fromARGB(150, 75, 25, 125), // Purple border
              fillColor:
                  const Color.fromARGB(70, 75, 25, 125), // 70% transparency
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color borderColor,
    required Color fillColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor), // Border color
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
