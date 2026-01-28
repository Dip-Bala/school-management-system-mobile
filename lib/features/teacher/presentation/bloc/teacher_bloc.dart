import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/teacher_repository.dart';
import 'teacher_event.dart';
import 'teacher_state.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final TeacherRepository _repository;

  TeacherBloc({TeacherRepository? repository})
      : _repository = repository ?? TeacherRepository(),
        super(const TeacherInitial()) {
    on<LoadAllTeachersEvent>(_onLoadAllTeachers);
    on<LoadTeacherByIdEvent>(_onLoadTeacherById);
    on<CreateTeacherEvent>(_onCreateTeacher);
    on<UpdateTeacherEvent>(_onUpdateTeacher);
    on<DeleteTeacherEvent>(_onDeleteTeacher);
  }

  Future<void> _onLoadAllTeachers(
    LoadAllTeachersEvent event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherLoading());
    try {
      final teachers = await _repository.getAllTeachers();
      emit(TeacherLoaded(teachers));
    } catch (e) {
      emit(TeacherError('Failed to load teachers: ${e.toString()}'));
    }
  }

  Future<void> _onLoadTeacherById(
    LoadTeacherByIdEvent event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherLoading());
    try {
      final teacher = await _repository.getTeacherById(event.teacherId);
      if (teacher != null) {
        emit(TeacherDetailLoaded(teacher));
      } else {
        emit(const TeacherError('Teacher not found'));
      }
    } catch (e) {
      emit(TeacherError('Failed to load teacher: ${e.toString()}'));
    }
  }

  Future<void> _onCreateTeacher(
    CreateTeacherEvent event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherLoading());
    try {
      await _repository.createTeacher(event.teacher);
      emit(const TeacherOperationSuccess('Teacher created successfully'));
      add(const LoadAllTeachersEvent());
    } catch (e) {
      emit(TeacherError('Failed to create teacher: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateTeacher(
    UpdateTeacherEvent event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherLoading());
    try {
      await _repository.updateTeacher(event.teacher);
      emit(const TeacherOperationSuccess('Teacher updated successfully'));
      add(const LoadAllTeachersEvent());
    } catch (e) {
      emit(TeacherError('Failed to update teacher: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteTeacher(
    DeleteTeacherEvent event,
    Emitter<TeacherState> emit,
  ) async {
    emit(const TeacherLoading());
    try {
      await _repository.deleteTeacher(event.teacherId);
      emit(const TeacherOperationSuccess('Teacher deleted successfully'));
      add(const LoadAllTeachersEvent());
    } catch (e) {
      emit(TeacherError('Failed to delete teacher: ${e.toString()}'));
    }
  }
}
