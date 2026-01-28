import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  final String id;
 final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String employeeId;
  final String department;
  final List<String> subjects;
  final bool isActive;

  const TeacherEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.employeeId,
    required this.department,
    required this.subjects,
    required this.isActive,
  });

  String get fullName => '$firstName $lastName';

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        employeeId,
        department,
        subjects,
        isActive,
      ];
}
