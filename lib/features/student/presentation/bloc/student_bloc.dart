import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/student_repository.dart';
import 'student_event.dart';
import 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository _repository;

  StudentBloc({StudentRepository? repository})
      : _repository = repository ?? StudentRepository(),
        super(const StudentInitial()) {
    on<LoadAllStudentsEvent>(_onLoadAllStudents);
    on<LoadStudentByIdEvent>(_onLoadStudentById);
    on<LoadStudentsByClassEvent>(_onLoadStudentsByClass);
    on<CreateStudentEvent>(_onCreateStudent);
    on<UpdateStudentEvent>(_onUpdateStudent);
    on<DeleteStudentEvent>(_onDeleteStudent);
    on<SearchStudentsEvent>(_onSearchStudents);
  }

  Future<void> _onLoadAllStudents(
    LoadAllStudentsEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      final students = await _repository.getAllStudents();
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError('Failed to load students: ${e.toString()}'));
    }
  }

  Future<void> _onLoadStudentById(
    LoadStudentByIdEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      final student = await _repository.getStudentById(event.studentId);
      if (student != null) {
        emit(StudentDetailLoaded(student));
      } else {
        emit(const StudentError('Student not found'));
      }
    } catch (e) {
      emit(StudentError('Failed to load student: ${e.toString()}'));
    }
  }

  Future<void> _onLoadStudentsByClass(
    LoadStudentsByClassEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      final students = await _repository.getStudentsByClass(event.classId);
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError('Failed to load students: ${e.toString()}'));
    }
  }

  Future<void> _onCreateStudent(
    CreateStudentEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      await _repository.createStudent(event.student);
      emit(const StudentOperationSuccess('Student created successfully'));
      // Reload all students
      add(const LoadAllStudentsEvent());
    } catch (e) {
      emit(StudentError('Failed to create student: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateStudent(
    UpdateStudentEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      await _repository.updateStudent(event.student);
      emit(const StudentOperationSuccess('Student updated successfully'));
      // Reload all students
      add(const LoadAllStudentsEvent());
    } catch (e) {
      emit(StudentError('Failed to update student: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteStudent(
    DeleteStudentEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      await _repository.deleteStudent(event.studentId);
      emit(const StudentOperationSuccess('Student deleted successfully'));
      // Reload all students
      add(const LoadAllStudentsEvent());
    } catch (e) {
      emit(StudentError('Failed to delete student: ${e.toString()}'));
    }
  }

  Future<void> _onSearchStudents(
    SearchStudentsEvent event,
    Emitter<StudentState> emit,
  ) async {
    emit(const StudentLoading());
    try {
      final students = await _repository.searchStudents(event.query);
      emit(StudentLoaded(students));
    } catch (e) {
      emit(StudentError('Failed to search students: ${e.toString()}'));
    }
  }
}
