import '../models/notification_model.dart';
import '../services/notification_service.dart';

class NotificationRepository {
  final NotificationService _service;
  
  NotificationRepository({NotificationService? service}) : _service = service ?? NotificationService();

  Future<List<NotificationModel>> getAllNotifications() => _service.fetchAllNotifications();
  Future<void> sendNotification(NotificationModel notification) => _service.sendNotification(notification);
}
