class EnrollmentModel {
  final String id;
  final String studentId;
  final String classId;
  final String section;
  final String academicYear;
  final DateTime enrollmentDate;
  final String status; // active, completed, withdrawn
  final String? remarks;
  final DateTime createdAt;
  final DateTime updatedAt;

  const EnrollmentModel({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.section,
    required this.academicYear,
    required this.enrollmentDate,
    required this.status,
    this.remarks,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EnrollmentModel.fromJson(Map<String, dynamic> json) {
    return EnrollmentModel(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      classId: json['classId'] as String,
      section: json['section'] as String,
      academicYear: json['academicYear'] as String,
      enrollmentDate: DateTime.parse(json['enrollmentDate'] as String),
      status: json['status'] as String,
      remarks: json['remarks'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'classId': classId,
      'section': section,
      'academicYear': academicYear,
      'enrollmentDate': enrollmentDate.toIso8601String(),
      'status': status,
      'remarks': remarks,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  EnrollmentModel copyWith({
    String? id,
    String? studentId,
    String? classId,
    String? section,
    String? academicYear,
    DateTime? enrollmentDate,
    String? status,
    String? remarks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EnrollmentModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      classId: classId ?? this.classId,
      section: section ?? this.section,
      academicYear: academicYear ?? this.academicYear,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
      status: status ?? this.status,
      remarks: remarks ?? this.remarks,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
