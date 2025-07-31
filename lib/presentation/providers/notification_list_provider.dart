import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationListProvider = StateNotifierProvider<NotificationListNotifier, List<String>>(
      (ref) => NotificationListNotifier(),
);

class NotificationListNotifier extends StateNotifier<List<String>> {
  NotificationListNotifier() : super([]);

  void add(String notification) {
    state = [...state, notification];
  }
}
