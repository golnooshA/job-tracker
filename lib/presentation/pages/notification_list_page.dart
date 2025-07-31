import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/design_config.dart';
import '../providers/notification_list_provider.dart';
import '../widgets/no_result.dart';

class NotificationListPage extends ConsumerWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationListProvider);
    final design = DesignConfig.current;

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      backgroundColor: design.backgroundColor,

      body: notifications.isEmpty
          ? const NoResult(
        image: 'assets/images/no_notification.png',
        text: 'No notifications yet',
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (_, index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.notifications_active),
              title: Text(notifications[index]),
            ),
          );
        },
      ),
    );
  }
}
