import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification/utils/notification_helper.dart';

import 'ui/detail_page.dart';
import 'ui/home_page.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper _notificationHelper = NotificationHelper();

  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  _notificationHelper.requestIOSPermissions(flutterLocalNotificationsPlugin);

  runApp(MaterialApp(
    initialRoute: HomePage.routeName,
    routes: {
      HomePage.routeName: (context) => HomePage(),
      DetailPage.routeName: (context) => DetailPage(),
    },
  ));
}
