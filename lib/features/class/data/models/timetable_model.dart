class TimetableModel {
  final String id;
  final String classId;
  final String day;
  final String period;
  final String subjectId;
  final String teacherId;
  final String startTime;
  final String endTime;

  const TimetableModel({
    required this.id,
    required this.classId,
    required this.day,
    required this.period,
    required this.subjectId,
    required this.teacherId,
    required this.startTime,
    required this.endTime,
  });

  factory TimetableModel.fromJson(Map<String, dynamic> json) => TimetableModel(
        id: json['id'],
        classId: json['classId'],
        day: json['day'],
        period: json['period'],
        subjectId: json['subjectId'],
        teacherId: json['teacherId'],
        startTime: json['startTime'],
        endTime: json['endTime'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'classId': classId,
        'day': day,
        'period': period,
        'subjectId': subjectId,
        'teacherId': teacherId,
        'startTime': startTime,
        'endTime': endTime,
      };
}
