import 'package:equatable/equatable.dart';

class StudentEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? profileImage;
  final String classId;
  final String section;
  final String rollNumber;
  final DateTime dateOfBirth;
  final String gender;
  final String address;
  final String parentName;
  final String parentPhone;
  final String parentEmail;
  final String bloodGroup;
  final DateTime enrollmentDate;
  final bool isActive;

  const StudentEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.classId,
    required this.section,
    required this.rollNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.parentName,
    required this.parentPhone,
    required this.parentEmail,
    required this.bloodGroup,
    required this.enrollmentDate,
    required this.isActive,
  });

  String get fullName => '$firstName $lastName';

  int get age {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        profileImage,
        classId,
        section,
        rollNumber,
        dateOfBirth,
        gender,
        address,
        parentName,
        parentPhone,
        parentEmail,
        bloodGroup,
        enrollmentDate,
        isActive,
      ];
}
