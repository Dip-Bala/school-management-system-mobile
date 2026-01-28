class AssignmentModel {
  final String id;
  final String title;
  final String description;
  final String classId;
  final String subjectId;
  final String teacherId;
  final DateTime dueDate;
  final int totalMarks;
  final String? attachmentUrl;
  final DateTime createdAt;

  const AssignmentModel({
    required this.id,
    required this.title,
    required this.description,
    required this.classId,
    required this.subjectId,
    required this.teacherId,
    required this.dueDate,
    required this.totalMarks,
    this.attachmentUrl,
    required this.createdAt,
  });

  factory AssignmentModel.fromJson(Map<String, dynamic> json) => AssignmentModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        classId: json['classId'],
        subjectId: json['subjectId'],
        teacherId: json['teacherId'],
        dueDate: DateTime.parse(json['dueDate']),
        totalMarks: json['totalMarks'],
        attachmentUrl: json['attachmentUrl'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'classId': classId,
        'subjectId': subjectId,
        'teacherId': teacherId,
        'dueDate': dueDate.toIso8601String(),
        'totalMarks': totalMarks,
        'attachmentUrl': attachmentUrl,
        'createdAt': createdAt.toIso8601String(),
      };
}
