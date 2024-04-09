// Checked with Source Downloaded.
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:idaawee/utils/global.dart';

class PushNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future initialize(context) async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      _messaging.getInitialMessage();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: 123,
            channelKey: "call_channel",
            color: Colors.white,
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString(),
            category: NotificationCategory.Call,
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            displayOnForeground: true,
            displayOnBackground: true,
            backgroundColor: Colors.orange,
          ),
        );
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

      String? token = await _messaging.getToken();

      await saqvetoken(token.toString());

      _messaging.subscribeToTopic('alldrivers');
      _messaging.subscribeToTopic('allusers');
    } else {
      return;
    }
  }

  saqvetoken(String token) async {
    String? userId = await Global().getUserId();
    String? userindex = await Global().getUserindex();
    if (userId != null || userId!.isNotEmpty) {
      driversRef.child(userId.toString()).child('token').set(token);
    }
  }
}

DatabaseReference driversRef =
    FirebaseDatabase.instance.ref().child('hospitals');

Future<void> BackgroundHandler(RemoteMessage remoteMessage) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 456,
        channelKey: "call_channel",
        color: Colors.white,
        title: "Incoming Call Request",
        body: "Recovery Request",
        category: NotificationCategory.Call,
        wakeUpScreen: true,
        fullScreenIntent: true,
        autoDismissible: false,
        backgroundColor: Colors.orange,
      ),
      actionButtons: [
        NotificationActionButton(
            key: "View",
            label: "View",
            color: Colors.green,
            autoDismissible: true),
      ]);
}
