import 'package:flutter/material.dart';

class SubjectListWidget extends StatelessWidget {
  final List<String> subjects;
  const SubjectListWidget({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Subjects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...subjects.map((s) => Chip(label: Text(s))).toList(),
          ],
        ),
      ),
    );
  }
}
