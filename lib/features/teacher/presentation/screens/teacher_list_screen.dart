import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/teacher_bloc.dart';
import '../bloc/teacher_event.dart';
import '../bloc/teacher_state.dart';
import '../widgets/teacher_card.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart' as custom;

class TeacherListScreen extends StatefulWidget {
  const TeacherListScreen({super.key});

  @override
  State<TeacherListScreen> createState() => _TeacherListScreenState();
}

class _TeacherListScreenState extends State<TeacherListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TeacherBloc>().add(const LoadAllTeachersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, state) {
          if (state is TeacherLoading) {
            return const LoadingWidget();
          } else if (state is TeacherLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.teachers.length,
              itemBuilder: (context, index) =>
                  TeacherCard(teacher: state.teachers[index]),
            );
          } else if (state is TeacherError) {
            return custom.CustomErrorWidget(
              message: state.message,
              onRetry: () => context.read<TeacherBloc>().add(const LoadAllTeachersEvent()),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
