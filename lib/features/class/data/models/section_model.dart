class SectionModel {
  final String id;
  final String classId;
  final String name;
  final int capacity;

  const SectionModel({
    required this.id,
    required this.classId,
    required this.name,
    required this.capacity,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
        id: json['id'],
        classId: json['classId'],
        name: json['name'],
        capacity: json['capacity'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'classId': classId,
        'name': name,
        'capacity': capacity,
      };
}
