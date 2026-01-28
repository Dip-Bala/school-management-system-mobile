import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  const TeacherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Section
            Row(
              children: [
                Expanded(child: _buildStatCard('My Classes', '5', Icons.class_, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Students', '125', Icons.people, Colors.green)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('Assignments', '8', Icons.assignment, Colors.orange)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Pending', '3', Icons.pending_actions, Colors.red)),
              ],
            ),
            const SizedBox(height: 24),

            // Today's Schedule
            const Text('Today\'s Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildScheduleItem('9:00 AM', 'Mathematics', 'Class 10-A'),
            _buildScheduleItem('11:00 AM', 'Physics', 'Class 10-B'),
            _buildScheduleItem('2:00 PM', 'Chemistry', 'Class 10-A'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleItem(String time, String subject, String className) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.schedule, color: Colors.blue),
        title: Text(subject),
        subtitle: Text(className),
        trailing: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
