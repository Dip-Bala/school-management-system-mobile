class AnnouncementModel {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final DateTime publishedAt;
  final String? imageUrl;

  const AnnouncementModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.publishedAt,
    this.imageUrl,
  });

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) => AnnouncementModel(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        authorId: json['authorId'],
        publishedAt: DateTime.parse(json['publishedAt']),
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'authorId': authorId,
        'publishedAt': publishedAt.toIso8601String(),
        'imageUrl': imageUrl,
      };
}
