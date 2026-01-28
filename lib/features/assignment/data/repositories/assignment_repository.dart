import '../models/assignment_model.dart';
import '../services/assignment_service.dart';

class AssignmentRepository {
  final AssignmentService _service;
  
  AssignmentRepository({AssignmentService? service}) : _service = service ?? AssignmentService();

  Future<List<AssignmentModel>> getAllAssignments() => _service.fetchAllAssignments();
  Future<AssignmentModel> createAssignment(AssignmentModel assignment) => _service.createAssignment(assignment);
}
