import 'package:flutter/material.dart';

class TeacherScheduleWidget extends StatelessWidget {
  const TeacherScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('No schedule available'),
          ],
        ),
      ),
    );
  }
}
