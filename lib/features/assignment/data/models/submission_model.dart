class SubmissionModel {
  final String id;
  final String assignmentId;
  final String studentId;
  final String? submissionUrl;
  final String? comments;
  final DateTime submittedAt;
  final int? marksObtained;
  final String? feedback;
  final String status; // pending, submitted, graded

  const SubmissionModel({
    required this.id,
    required this.assignmentId,
    required this.studentId,
    this.submissionUrl,
    this.comments,
    required this.submittedAt,
    this.marksObtained,
    this.feedback,
    required this.status,
  });

  factory SubmissionModel.fromJson(Map<String, dynamic> json) => SubmissionModel(
        id: json['id'],
        assignmentId: json['assignmentId'],
        studentId: json['studentId'],
        submissionUrl: json['submissionUrl'],
        comments: json['comments'],
        submittedAt: DateTime.parse(json['submittedAt']),
        marksObtained: json['marksObtained'],
        feedback: json['feedback'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'assignmentId': assignmentId,
        'studentId': studentId,
        'submissionUrl': submissionUrl,
        'comments': comments,
        'submittedAt': submittedAt.toIso8601String(),
        'marksObtained': marksObtained,
        'feedback': feedback,
        'status': status,
      };
}
