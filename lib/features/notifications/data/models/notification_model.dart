class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String type; // announcement, alert, reminder
  final String? targetRole; // student, teacher, all
  final DateTime createdAt;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    this.targetRole,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        id: json['id'],
        title: json['title'],
        message: json['message'],
        type: json['type'],
        targetRole: json['targetRole'],
        createdAt: DateTime.parse(json['createdAt']),
        isRead: json['isRead'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'type': type,
        'targetRole': targetRole,
        'createdAt': createdAt.toIso8601String(),
        'isRead': isRead,
      };
}
