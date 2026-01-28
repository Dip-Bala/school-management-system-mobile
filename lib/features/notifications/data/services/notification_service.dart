import '../models/notification_model.dart';

class NotificationService {
  Future<List<NotificationModel>> fetchAllNotifications() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<void> sendNotification(NotificationModel notification) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
