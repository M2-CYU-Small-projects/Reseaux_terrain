import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlertNotification {
  static final AlertNotification _notificationService =
  AlertNotification._internal();

  factory AlertNotification() {
    return _notificationService;
  }

  AlertNotification._internal();

}