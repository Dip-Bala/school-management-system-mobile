class TeacherModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? profileImage;
  final String employeeId;
  final String department;
  final List<String> subjects;
  final String qualification;
  final DateTime joiningDate;
  final String address;
  final String bloodGroup;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TeacherModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.employeeId,
    required this.department,
    required this.subjects,
    required this.qualification,
    required this.joiningDate,
    required this.address,
    required this.bloodGroup,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      profileImage: json['profileImage'] as String?,
      employeeId: json['employeeId'] as String,
      department: json['department'] as String,
      subjects: List<String>.from(json['subjects'] as List),
      qualification: json['qualification'] as String,
      joiningDate: DateTime.parse(json['joiningDate'] as String),
      address: json['address'] as String,
      bloodGroup: json['bloodGroup'] as String,
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
      'employeeId': employeeId,
      'department': department,
      'subjects': subjects,
      'qualification': qualification,
      'joiningDate': joiningDate.toIso8601String(),
      'address': address,
      'bloodGroup': bloodGroup,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  String get fullName => '$firstName $lastName';

  TeacherModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? profileImage,
    String? employeeId,
    String? department,
    List<String>? subjects,
    String? qualification,
    DateTime? joiningDate,
    String? address,
    String? bloodGroup,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TeacherModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      employeeId: employeeId ?? this.employeeId,
      department: department ?? this.department,
      subjects: subjects ?? this.subjects,
      qualification: qualification ?? this.qualification,
      joiningDate: joiningDate ?? this.joiningDate,
      address: address ?? this.address,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
