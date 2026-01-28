import '../../data/repositories/student_repository.dart';
import '../../data/models/student_model.dart';

class GetStudentUseCase {
  final StudentRepository _repository;

  GetStudentUseCase(this._repository);

  Future<StudentModel?> call(String studentId) async {
    return await _repository.getStudentById(studentId);
  }
}

class GetAllStudentsUseCase {
  final StudentRepository _repository;

  GetAllStudentsUseCase(this._repository);

  Future<List<StudentModel>> call() async {
    return await _repository.getAllStudents();
  }
}

class GetStudentsByClassUseCase {
  final StudentRepository _repository;

  GetStudentsByClassUseCase(this._repository);

  Future<List<StudentModel>> call(String classId) async {
    return await _repository.getStudentsByClass(classId);
  }
}
