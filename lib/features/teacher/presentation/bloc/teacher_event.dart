import 'package:equatable/equatable.dart';
import '../../data/models/teacher_model.dart';

abstract class TeacherEvent extends Equatable {
  const TeacherEvent();
  @override
  List<Object?> get props => [];
}

class LoadAllTeachersEvent extends TeacherEvent {
  const LoadAllTeachersEvent();
}

class LoadTeacherByIdEvent extends TeacherEvent {
  final String teacherId;
  const LoadTeacherByIdEvent(this.teacherId);
  @override
  List<Object?> get props => [teacherId];
}

class CreateTeacherEvent extends TeacherEvent {
  final TeacherModel teacher;
  const CreateTeacherEvent(this.teacher);
  @override
  List<Object?> get props => [teacher];
}

class UpdateTeacherEvent extends TeacherEvent {
  final TeacherModel teacher;
  const UpdateTeacherEvent(this.teacher);
  @override
  List<Object?> get props => [teacher];
}

class DeleteTeacherEvent extends TeacherEvent {
  final String teacherId;
  const DeleteTeacherEvent(this.teacherId);
  @override
  List<Object?> get props => [teacherId];
}
