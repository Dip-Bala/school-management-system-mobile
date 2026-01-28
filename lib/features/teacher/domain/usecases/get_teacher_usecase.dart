import '../../data/repositories/teacher_repository.dart';
import '../../data/models/teacher_model.dart';

class GetTeacherUseCase {
  final TeacherRepository _repository;

  GetTeacherUseCase(this._repository);

  Future<TeacherModel?> call(String teacherId) async {
    return await _repository.getTeacherById(teacherId);
  }
}

class GetAllTeachersUseCase {
  final TeacherRepository _repository;

  GetAllTeachersUseCase(this._repository);

  Future<List<TeacherModel>> call() async {
    return await _repository.getAllTeachers();
  }
}
