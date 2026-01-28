import '../models/class_model.dart';
import '../services/class_service.dart';

class ClassRepository {
  final ClassService _service;
  
  ClassRepository({ClassService? service}) : _service = service ?? ClassService();

  Future<List<ClassModel>> getAllClasses() => _service.fetchAllClasses();
  Future<ClassModel?> getClassById(String id) => _service.fetchClassById(id);
}
