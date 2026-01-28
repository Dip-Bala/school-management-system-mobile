import '../models/class_model.dart';

class ClassService {
  Future<List<ClassModel>> fetchAllClasses() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<ClassModel?> fetchClassById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }
}
