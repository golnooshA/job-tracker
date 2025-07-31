import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await _notificationsPlugin.initialize(settings);
  }

  static Future<void> showTestNotification(String title, String body) async {
    const android = AndroidNotificationDetails(
      'job_channel',
      'Job Notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    const notificationDetails = NotificationDetails(android: android);

    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }
}
