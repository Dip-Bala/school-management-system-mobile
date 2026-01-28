class SubjectAssignmentModel {
  final String id;
  final String teacherId;
  final String subjectId;
  final String subjectName;
  final String classId;
  final String section;
  final String academicYear;
  final DateTime assignedDate;
  final bool isActive;

  const SubjectAssignmentModel({
    required this.id,
    required this.teacherId,
    required this.subjectId,
    required this.subjectName,
    required this.classId,
    required this.section,
    required this.academicYear,
    required this.assignedDate,
    required this.isActive,
  });

  factory SubjectAssignmentModel.fromJson(Map<String, dynamic> json) {
    return SubjectAssignmentModel(
      id: json['id'] as String,
      teacherId: json['teacherId'] as String,
      subjectId: json['subjectId'] as String,
      subjectName: json['subjectName'] as String,
      classId: json['classId'] as String,
      section: json['section'] as String,
      academicYear: json['academicYear'] as String,
      assignedDate: DateTime.parse(json['assignedDate'] as String),
      isActive: json['isActive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacherId': teacherId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'classId': classId,
      'section': section,
      'academicYear': academicYear,
      'assignedDate': assignedDate.toIso8601String(),
      'isActive': isActive,
    };
  }
}
