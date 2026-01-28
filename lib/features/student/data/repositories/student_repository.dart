import '../models/student_model.dart';
import '../services/student_service.dart';

class StudentRepository {
  final StudentService _studentService;

  StudentRepository({StudentService? studentService})
      : _studentService = studentService ?? StudentService();

  Future<List<StudentModel>> getAllStudents() async {
    // TODO: Implement API call through service
    return _studentService.fetchAllStudents();
  }

  Future<StudentModel?> getStudentById(String id) async {
    // TODO: Implement API call through service
    return _studentService.fetchStudentById(id);
  }

  Future<List<StudentModel>> getStudentsByClass(String classId) async {
    // TODO: Implement API call through service
    return _studentService.fetchStudentsByClass(classId);
  }

  Future<StudentModel> createStudent(StudentModel student) async {
    // TODO: Implement API call through service
    return _studentService.createStudent(student);
  }

  Future<StudentModel> updateStudent(StudentModel student) async {
    // TODO: Implement API call through service
    return _studentService.updateStudent(student);
  }

  Future<void> deleteStudent(String id) async {
    // TODO: Implement API call through service
    return _studentService.deleteStudent(id);
  }

  Future<List<StudentModel>> searchStudents(String query) async {
    // TODO: Implement search through service
    return _studentService.searchStudents(query);
  }
}
