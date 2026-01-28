import '../models/student_model.dart';

class StudentService {
  // TODO: Add API client (e.g., Dio, http)
  // final ApiClient _apiClient;

  StudentService();

  Future<List<StudentModel>> fetchAllStudents() async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.get('/students');
    // return (response.data as List).map((json) => StudentModel.fromJson(json)).toList();
    
    // Temporary mock data
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<StudentModel?> fetchStudentById(String id) async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.get('/students/$id');
    // return StudentModel.fromJson(response.data);
    
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  Future<List<StudentModel>> fetchStudentsByClass(String classId) async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.get('/students?classId=$classId');
    
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<StudentModel> createStudent(StudentModel student) async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.post('/students', data: student.toJson());
    // return StudentModel.fromJson(response.data);
    
    await Future.delayed(const Duration(seconds: 1));
    return student;
  }

  Future<StudentModel> updateStudent(StudentModel student) async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.put('/students/${student.id}', data: student.toJson());
    
    await Future.delayed(const Duration(seconds: 1));
    return student;
  }

  Future<void> deleteStudent(String id) async {
    // TODO: Implement API call
    // Example: await _apiClient.delete('/students/$id');
    
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<List<StudentModel>> searchStudents(String query) async {
    // TODO: Implement API call
    // Example: final response = await _apiClient.get('/students/search?q=$query');
    
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }
}
