import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/student_bloc.dart';
import '../bloc/student_event.dart';
import '../bloc/student_state.dart';
import '../widgets/student_card.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../../shared/widgets/error_widget.dart' as custom;
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/search_bar_widget.dart';
import '../../../../core/constants/route_constants.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<StudentBloc>().add(const LoadAllStudentsEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.isEmpty) {
      context.read<StudentBloc>().add(const LoadAllStudentsEvent());
    } else {
      context.read<StudentBloc>().add(SearchStudentsEvent(query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Show filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBarWidget(
            controller: _searchController,
            onChanged: _onSearchChanged,
            hintText: 'Search students...',
          ),
          Expanded(
            child: BlocBuilder<StudentBloc, StudentState>(
              builder: (context, state) {
                if (state is StudentLoading) {
                  return const LoadingWidget();
                } else if (state is StudentLoaded) {
                  if (state.students.isEmpty) {
                    return const EmptyStateWidget(
                      message: 'No students found',
                      icon: Icons.people_outline,
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.students.length,
                    itemBuilder: (context, index) {
                      return StudentCard(
                        student: state.students[index],
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteConstants.studentDetail,
                            arguments: state.students[index].id,
                          );
                        },
                      );
                    },
                  );
                } else if (state is StudentError) {
                  return custom.CustomErrorWidget(
                    message: state.message,
                    onRetry: () {
                      context.read<StudentBloc>().add(const LoadAllStudentsEvent());
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.addStudent);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
