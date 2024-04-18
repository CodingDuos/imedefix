// Checked with Source Downloaded.
import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:idaawee/utils/global.dart';
import 'package:http/http.dart' as http;

String serverKey =
    'key=AAAAAWnrHQw:APA91bHnRSyRdSnbWoyStY1U4FUaS_BJtLFo0RG_nQxgx6I8Gm3MEB_8VNH94UukcKw1Vi7gpCWrCVEPu0cYWnaUG7Go4xx69sbeH9orRpYLE8ytzyV_aCSr9FpkYZHOB6-WKilYpVOA';

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

      _messaging.subscribeToTopic('allhospitals');
    } else {
      return;
    }
  }

  saqvetoken(String token) async {
    String? userId = await Global().getUserId();

    if (userId != null || userId!.isNotEmpty) {
      driversRef.child(userId.toString()).child('token').set(token);
    }
  }

  fetchToken(String doctorId) async {
    try {
      String tokenfetched = '';
      DatabaseReference doctorsRef =
          FirebaseDatabase.instance.ref().child('hospitals');
      await doctorsRef
          .child(doctorId)
          .child('token')
          .once()
          .then((DatabaseEvent databaseEvent) {
        String? token = databaseEvent.snapshot.value as String?;
        tokenfetched = token.toString();
      });
      return tokenfetched;
    } catch (e) {
      print('Error fetching token: $e');
      return null;
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

sendNotificationToDoctor(String token, context) async {
  Map<String, String> headerMap = {
    'Content-Type': 'application/json',
    'Authorization': serverKey,
  };

  Map notificationMap = {
    'body': 'calling Request',
    'title': 'New call meeting Request',
  };

  Map dataMap = {
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    'id': '1',
    'status': 'done',
    'rideType': ""
  };

  Map sendNotificationMap = {
    'notification': notificationMap,
    'data': dataMap,
    'priority': 'high',
    'to': token,
  };

  await http.post(
    Uri.parse('https://fcm.googleapis.com/fcm/send'),
    headers: headerMap,
    body: jsonEncode(sendNotificationMap),
  );
}
