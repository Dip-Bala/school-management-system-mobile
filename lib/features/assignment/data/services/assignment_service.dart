import '../models/assignment_model.dart';

class AssignmentService {
  Future<List<AssignmentModel>> fetchAllAssignments() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<AssignmentModel> createAssignment(AssignmentModel assignment) async {
    await Future.delayed(const Duration(seconds: 1));
    return assignment;
  }
}
