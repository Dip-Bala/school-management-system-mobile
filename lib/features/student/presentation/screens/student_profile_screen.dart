import 'package:flutter/material.dart';
import '../../data/models/student_model.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Get student from authentication/session
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 16),
            
            // Name
            const Text(
              'Student Name',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            
            // Roll Number & Class
            Text(
              'Class 10 - Section A',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            
            // Profile Information Cards
            _buildInfoCard(
              'Contact Information',
              [
                _buildInfoRow(Icons.email, 'Email', 'student@email.com'),
                _buildInfoRow(Icons.phone, 'Phone', '+91 1234567890'),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildInfoCard(
              'Academic Information',
              [
                _buildInfoRow(Icons.school, 'Roll Number', '2024001'),
                _buildInfoRow(Icons.calendar_today, 'Enrollment', '01 Jan 2024'),
                _buildInfoRow(Icons.verified, 'Status', 'Active'),
              ],
            ),
            const SizedBox(height: 16),
            
            _buildInfoCard(
              'Parent Information',
              [
                _buildInfoRow(Icons.person, 'Parent Name', 'Parent Name'),
                _buildInfoRow(Icons.phone, 'Parent Phone', '+91 9876543210'),
                _buildInfoRow(Icons.email, 'Parent Email', 'parent@email.com'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
