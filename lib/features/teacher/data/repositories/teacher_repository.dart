import '../models/teacher_model.dart';
import '../services/teacher_service.dart';

class TeacherRepository {
  final TeacherService _teacherService;

  TeacherRepository({TeacherService? teacherService})
      : _teacherService = teacherService ?? TeacherService();

  Future<List<TeacherModel>> getAllTeachers() async {
    return _teacherService.fetchAllTeachers();
  }

  Future<TeacherModel?> getTeacherById(String id) async {
    return _teacherService.fetchTeacherById(id);
  }

  Future<List<TeacherModel>> getTeachersByDepartment(String department) async {
    return _teacherService.fetchTeachersByDepartment(department);
  }

  Future<TeacherModel> createTeacher(TeacherModel teacher) async {
    return _teacherService.createTeacher(teacher);
  }

  Future<TeacherModel> updateTeacher(TeacherModel teacher) async {
    return _teacherService.updateTeacher(teacher);
  }

  Future<void> deleteTeacher(String id) async {
    return _teacherService.deleteTeacher(id);
  }
}
