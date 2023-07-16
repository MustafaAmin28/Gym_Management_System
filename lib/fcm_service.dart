import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:http/http.dart' as http;

/*
Example:
  flutter pub add http flutter_local_notifications


  1) Create Message Object. ["to" or "registration_ids" must be provided, all others are optional]
    final message = fcm.Message(
      registration_ids: [
        "eSKRt1tkTYquPLKk8Q7xni:APA91bFOdrziZHTurhee3HV-bN0l-HOI0vnVGziQfclsbrqvV7OIhli4UQoq2deWkTxVtsNB8YfxamQ09CJ0Ew9Cvhr2LLB0JSa0VrE0o1_UXNbhBFDk3y4GZkIev2qyVNnaxikW7oFV",
      ],
      /* to: "eSKRt1tkTYquPLKk8Q7xni:APA91bFOdrziZHTurhee3HV-bN0l-HOI0vnVGziQfclsbrqvV7OIhli4UQoq2deWkTxVtsNB8YfxamQ09CJ0Ew9Cvhr2LLB0JSa0VrE0o1_UXNbhBFDk3y4GZkIev2qyVNnaxikW7oFV", */
      data: {"location": "30, 30", "photo": "images\\national_ids\\letm69SRbVYkURydqxUnJmeojSi2.png"},
      notification: fcm.Notification(title: "Notification Title", body: "Notification Body"),
    );

  2) Send It
  final response = await fcm.FcmService.send(message);
  debugPrint(response.toString());
  ...

*/

class FcmService {
  static late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late final AndroidNotificationChannel androidChannel;
  static late final RemoteMessage? initialMessage;

  static Future<void> init() async {
    // Foreground FCM Notification Channel
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    androidChannel = const AndroidNotificationChannel('fcm_channel', 'FCM Notifications', 'FCM Notifications Channel', importance: Importance.max);
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidChannel);

    // * Called when an incoming FCM payload is received while the app in [foreground] state.
    FirebaseMessaging.onMessage.listen((message) => _handleMessage(message, true));

    // * Called when a user press on the notification message while the app in [background] state.
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // * Called when the application open from a [terminated] state.
    initialMessage = await FirebaseMessaging.instance.getInitialMessage();
  }

  static Future<String?> getToken() {
    return FirebaseMessaging.instance.getToken();
  }

  static Future<void> deleteToken() {
    return FirebaseMessaging.instance.deleteToken();
  }

  static Future<Map<String, dynamic>> send(Message message) async {
    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");

    final response = await http.post(
      uri,
      body: message.toJson(),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=AAAAIBqZXDg:APA91bEaabmstlM6h8GYyh7PwQSzx68oFHqHNdwszyNOuSGRRsn59ZF-RrGFB5HZSPhXfRGG3-jdoeGovqDDNHrN5EsjGeOsL1MKY-ho6F0hNkP_SIlKhGeJ9oI95BLUm7bFwFEr91jr'
      },
    );

    return jsonDecode(response.body);
  }

  static void handleInitialMessage() {
    return _handleMessage(initialMessage);
  }

  static void _handleMessage(RemoteMessage? message, [bool isForeground = false]) {
    if (message == null) return;
    // if (message.data["sender"] == null) return;
    // final sender = PersonModel.fromJson(message.data["sender"]);
    if (isForeground) {
      _showNotification(message.notification);
      // showDialog(
      //   context: navigatorKey.currentState!.context,
      //   builder: (context) {
      //     return AlertDialog(
      //       title: Text(message.notification!.title!),
      //       content: Text(message.notification!.body!),
      //       actions: [
      //         TextButton(child: const Text("Ignore"), onPressed: () => navigatorKey.currentState!.pop()),
      //         TextButton(child: const Text("Open"), onPressed: () => navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => ChatScreen(receiverParticipant: sender)))),
      //       ],
      //     );
      //   },
      // );
      return;
    }

    // navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => ChatScreen(receiverParticipant: sender)));
  }

  static void _showNotification(RemoteNotification? notification) {
    if (notification == null) return;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(android: AndroidNotificationDetails(androidChannel.id, androidChannel.name, '', icon: "@mipmap/ic_launcher")),
    );
  }

  static Future<void> subscribeTo(String topic) {
    return FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static Future<void> unsubscribeFrom(String topic) {
    return FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  }

  static Future<Map<String, dynamic>> sendToTopic(String topic, Message message) async {
    return send(message.copyWith(to: "/topics/$topic"));
  }
}

// ---------------------------------------------- Models ---------------------------------------------- //

class Message {
  final String? to;
  final Map<String, dynamic>? data;
  final Notification? notification;
  // ignore: non_constant_identifier_names
  final List<String>? registration_ids;

  Message({
    this.to,
    this.data,
    this.notification,
    // ignore: non_constant_identifier_names
    this.registration_ids,
  });

  Message copyWith({
    String? to,
    Map<String, dynamic>? data,
    Notification? notification,
    // ignore: non_constant_identifier_names
    List<String>? registration_ids,
  }) {
    return Message(
      to: to ?? this.to,
      data: data ?? this.data,
      notification: notification ?? this.notification,
      registration_ids: registration_ids ?? this.registration_ids,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'to': to,
      'data': data,
      'notification': notification?.toMap(),
      'registration_ids': registration_ids,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      to: map['to'],
      data: map['data'],
      notification: map['notification'] != null ? Notification.fromMap(map['notification']) : null,
      registration_ids: map['registration_ids'] != null ? List.from(map['registration_ids']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source));
}

class Notification {
  final String? title;
  final String? body;
  Notification({this.title, this.body});

  Notification copyWith({String? title, String? body}) {
    return Notification(title: title ?? this.title, body: body ?? this.body);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'body': body};
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));
}
