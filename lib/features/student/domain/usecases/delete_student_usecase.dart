import '../../data/repositories/student_repository.dart';

class DeleteStudentUseCase {
  final StudentRepository _repository;

  DeleteStudentUseCase(this._repository);

  Future<void> call(String studentId) async {
    return await _repository.deleteStudent(studentId);
  }
}
