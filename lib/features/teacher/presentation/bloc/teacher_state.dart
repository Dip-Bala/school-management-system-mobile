import 'package:equatable/equatable.dart';
import '../../data/models/teacher_model.dart';

abstract class TeacherState extends Equatable {
  const TeacherState();
  @override
  List<Object?> get props => [];
}

class TeacherInitial extends TeacherState {
  const TeacherInitial();
}

class TeacherLoading extends TeacherState {
  const TeacherLoading();
}

class TeacherLoaded extends TeacherState {
  final List<TeacherModel> teachers;
  const TeacherLoaded(this.teachers);
  @override
  List<Object?> get props => [teachers];
}

class TeacherDetailLoaded extends TeacherState {
  final TeacherModel teacher;
  const TeacherDetailLoaded(this.teacher);
  @override
  List<Object?> get props => [teacher];
}

class TeacherOperationSuccess extends TeacherState {
  final String message;
  const TeacherOperationSuccess(this.message);
  @override
  List<Object?> get props => [message];
}

class TeacherError extends TeacherState {
  final String message;
  const TeacherError(this.message);
  @override
  List<Object?> get props => [message];
}
