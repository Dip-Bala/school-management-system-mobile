import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';
import '../widgets/student_info_card.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart' as custom;

class StudentDetailScreen extends StatefulWidget {
  final String studentId;

  const StudentDetailScreen({
    super.key,
    required this.studentId,
  });

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(LoadStudentByIdEvent(widget.studentId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Navigate to edit screen
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteConfirmation(context),
          ),
        ],
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const LoadingWidget();
          } else if (state is StudentDetailLoaded) {
            final student = state.student;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Header
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: student.profileImage != null
                              ? NetworkImage(student.profileImage!)
                              : null,
                          child: student.profileImage == null
                              ? Text(
                                  student.firstName[0].toUpperCase(),
                                  style: const TextStyle(fontSize: 32),
                                )
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          student.fullName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Roll No: ${student.rollNumber}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Personal Information
                  StudentInfoCard(
                    title: 'Personal Information',
                    items: [
                      {'Email': student.email},
                      {'Phone': student.phone},
                      {'Gender': student.gender},
                      {'Date of Birth': student.dateOfBirth.toString().split(' ')[0]},
                      {'Blood Group': student.bloodGroup},
                      {'Address': student.address},
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Academic Information
                  StudentInfoCard(
                    title: 'Academic Information',
                    items: [
                      {'Class': student.classId},
                      {'Section': student.section},
                      {'Enrollment Date': student.enrollmentDate.toString().split(' ')[0]},
                      {'Status': student.isActive ? 'Active' : 'Inactive'},
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Parent Information
                  StudentInfoCard(
                    title: 'Parent Information',
                    items: [
                      {'Parent Name': student.parentName},
                      {'Parent Phone': student.parentPhone},
                      {'Parent Email': student.parentEmail},
                    ],
                  ),
                ],
              ),
            );
          } else if (state is StudentError) {
            return custom.CustomErrorWidget(
              message: state.message,
              onRetry: () {
                context.read<StudentBloc>().add(LoadStudentByIdEvent(widget.studentId));
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Student'),
        content: const Text(
          'Are you sure you want to delete this student? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<StudentBloc>().add(DeleteStudentEvent(widget.studentId));
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
