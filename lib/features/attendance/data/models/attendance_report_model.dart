class AttendanceReportModel {
  final String studentId;
  final String studentName;
  final int totalDays;
  final int presentDays;
  final int absentDays;
  final int lateDays;
  final double attendancePercentage;

  const AttendanceReportModel({
    required this.studentId,
    required this.studentName,
    required this.totalDays,
    required this.presentDays,
    required this.absentDays,
    required this.lateDays,
    required this.attendancePercentage,
  });

  factory AttendanceReportModel.fromJson(Map<String, dynamic> json) => AttendanceReportModel(
        studentId: json['studentId'],
        studentName: json['studentName'],
        totalDays: json['totalDays'],
        presentDays: json['presentDays'],
        absentDays: json['absentDays'],
        lateDays: json['lateDays'],
        attendancePercentage: json['attendancePercentage'],
      );
}
