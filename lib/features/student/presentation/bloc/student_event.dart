import 'package:equatable/equatable.dart';
import '../../data/models/student_model.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllStudentsEvent extends StudentEvent {
  const LoadAllStudentsEvent();
}

class LoadStudentByIdEvent extends StudentEvent {
  final String studentId;

  const LoadStudentByIdEvent(this.studentId);

  @override
  List<Object?> get props => [studentId];
}

class LoadStudentsByClassEvent extends StudentEvent {
  final String classId;

  const LoadStudentsByClassEvent(this.classId);

  @override
  List<Object?> get props => [classId];
}

class CreateStudentEvent extends StudentEvent {
  final StudentModel student;

  const CreateStudentEvent(this.student);

  @override
  List<Object?> get props => [student];
}

class UpdateStudentEvent extends StudentEvent {
  final StudentModel student;

  const UpdateStudentEvent(this.student);

  @override
  List<Object?> get props => [student];
}

class DeleteStudentEvent extends StudentEvent {
  final String studentId;

  const DeleteStudentEvent(this.studentId);

  @override
  List<Object?> get props => [studentId];
}

class SearchStudentsEvent extends StudentEvent {
  final String query;

  const SearchStudentsEvent(this.query);

  @override
  List<Object?> get props => [query];
}
