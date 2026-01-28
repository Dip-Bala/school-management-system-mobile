import 'package:flutter/material.dart';
import '../../data/models/teacher_model.dart';

class TeacherCard extends StatelessWidget {
  final TeacherModel teacher;
  final VoidCallback? onTap;

  const TeacherCard({super.key, required this.teacher, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: teacher.profileImage != null ? NetworkImage(teacher.profileImage!) : null,
          child: teacher.profileImage == null ? Text(teacher.firstName[0]) : null,
        ),
        title: Text(teacher.fullName),
        subtitle: Text('${teacher.department} • ${teacher.subjects.join(", ")}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
