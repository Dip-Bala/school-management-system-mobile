import '../../data/repositories/teacher_repository.dart';

class AssignSubjectUseCase {
  final TeacherRepository _repository;

  AssignSubjectUseCase(this._repository);

  Future<void> call(String teacherId, String subjectId) async {
    // TODO: Implement subject assignment logic
    await Future.delayed(const Duration(seconds: 1));
  }
}
