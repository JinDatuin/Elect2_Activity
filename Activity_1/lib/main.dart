import 'package:flutter/material.dart';

void main() {
  runApp(StudentListApp());
}

class StudentListApp extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Angel', 'score': 98},
    {'name': 'Zyrell', 'score': 87},
    {'name': 'Charlie', 'score': 45},
    {'name': 'Alice', 'score': 85},
    {'name': 'Diana', 'score': 72},
    {'name': 'Ethan', 'score': 30},
    {'name': 'Bob', 'score': 78},
  ];

  String getStatus(int score) => score >= 75 ? 'Pass' : 'Fail';
  Color getStatusColor(int score) => score >= 75 ? Colors.green : Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grades',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Logo/Title Section (with icon title for now)
                const Center(
                  child: Column(
                    children: [
                      Icon(Icons.school, size: 60, color: Colors.indigo),
                      SizedBox(height: 10),
                      Text(
                        '🎓 Student Grades Overview',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Header Row
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Student',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Result',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Student List
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final name = student['name'];
                      final score = student['score'];
                      final status = getStatus(score);
                      final statusColor = getStatusColor(score);

                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://ui-avatars.com/api/?name=${Uri.encodeComponent(name)}&background=random&color=fff',
                              ),
                              radius: 22,
                            ),

                            const SizedBox(width: 12),
                            Expanded(
                              flex: 3,
                              child: Text(
                                name,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                score.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
