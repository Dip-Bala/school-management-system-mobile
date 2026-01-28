class AttendanceModel {
  final String id;
  final String studentId;
  final String classId;
  final DateTime date;
  final String status; // present, absent, late, excused
  final String? remarks;

  const AttendanceModel({
    required this.id,
    required this.studentId,
    required this.classId,
    required this.date,
    required this.status,
    this.remarks,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
        id: json['id'],
        studentId: json['studentId'],
        classId: json['classId'],
        date: DateTime.parse(json['date']),
        status: json['status'],
        remarks: json['remarks'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'classId': classId,
        'date': date.toIso8601String(),
        'status': status,
        'remarks': remarks,
      };
}
