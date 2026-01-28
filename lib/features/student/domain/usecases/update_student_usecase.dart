import '../../data/repositories/student_repository.dart';
import '../../data/models/student_model.dart';

class UpdateStudentUseCase {
  final StudentRepository _repository;

  UpdateStudentUseCase(this._repository);

  Future<StudentModel> call(StudentModel student) async {
    return await _repository.updateStudent(student);
  }
}

class CreateStudentUseCase {
  final StudentRepository _repository;

  CreateStudentUseCase(this._repository);

  Future<StudentModel> call(StudentModel student) async {
    return await _repository.createStudent(student);
  }
}
