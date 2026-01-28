import '../../data/repositories/teacher_repository.dart';
import '../../data/models/teacher_model.dart';

class UpdateTeacherUseCase {
  final TeacherRepository _repository;

  UpdateTeacherUseCase(this._repository);

  Future<TeacherModel> call(TeacherModel teacher) async {
    return await _repository.updateTeacher(teacher);
  }
}

class CreateTeacherUseCase {
  final TeacherRepository _repository;

  CreateTeacherUseCase(this._repository);

  Future<TeacherModel> call(TeacherModel teacher) async {
    return await _repository.createTeacher(teacher);
  }
}
