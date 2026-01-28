class ClassModel {
  final String id;
  final String className;
  final String grade;
  final String section;
  final String classTeacherId;
  final int maxStudents;
  final int currentStudents;
  final bool isActive;

  const ClassModel({
    required this.id,
    required this.className,
    required this.grade,
    required this.section,
    required this.classTeacherId,
    required this.maxStudents,
    required this.currentStudents,
    required this.isActive,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        id: json['id'],
        className: json['className'],
        grade: json['grade'],
        section: json['section'],
        classTeacherId: json['classTeacherId'],
        maxStudents: json['maxStudents'],
        currentStudents: json['currentStudents'],
        isActive: json['isActive'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'className': className,
        'grade': grade,
        'section': section,
        'classTeacherId': classTeacherId,
        'maxStudents': maxStudents,
        'currentStudents': currentStudents,
        'isActive': isActive,
      };
}
