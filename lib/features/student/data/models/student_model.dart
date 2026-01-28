class StudentModel {
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
  final DateTime createdAt;
  final DateTime updatedAt;

  const StudentModel({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImage: json['profileImage'] as String?,
      classId: json['classId'] as String,
      section: json['section'] as String,
      rollNumber: json['rollNumber'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String,
      address: json['address'] as String,
      parentName: json['parentName'] as String,
      parentPhone: json['parentPhone'] as String,
      parentEmail: json['parentEmail'] as String,
      bloodGroup: json['bloodGroup'] as String,
      enrollmentDate: DateTime.parse(json['enrollmentDate'] as String),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'profileImage': profileImage,
      'classId': classId,
      'section': section,
      'rollNumber': rollNumber,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'address': address,
      'parentName': parentName,
      'parentPhone': parentPhone,
      'parentEmail': parentEmail,
      'bloodGroup': bloodGroup,
      'enrollmentDate': enrollmentDate.toIso8601String(),
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String get fullName => '$firstName $lastName';

  StudentModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? profileImage,
    String? classId,
    String? section,
    String? rollNumber,
    DateTime? dateOfBirth,
    String? gender,
    String? address,
    String? parentName,
    String? parentPhone,
    String? parentEmail,
    String? bloodGroup,
    DateTime? enrollmentDate,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StudentModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      classId: classId ?? this.classId,
      section: section ?? this.section,
      rollNumber: rollNumber ?? this.rollNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      parentName: parentName ?? this.parentName,
      parentPhone: parentPhone ?? this.parentPhone,
      parentEmail: parentEmail ?? this.parentEmail,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
