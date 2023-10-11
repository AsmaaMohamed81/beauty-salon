import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'networkUtlis.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      Navigator.of(context).pushNamed(route!);
    });
  }

  static void getFirebaseToken() async {
    final _firebaseMessaging = FirebaseMessaging.instance;
    // With this token you can test it easily on your phone
    final token = _firebaseMessaging
        .getToken()
        .then((value) => print('TokenFirebase: $value'));
    if (NetworkUtil.userModel!.member!.userId != null) {
      NetworkUtil _utils = new NetworkUtil();
      UpdateTokenModel updateTokenModel;
      Response response = await _utils.post("Auth/update_token",
          body: FormData.fromMap({
            "user_id": NetworkUtil.userModel!.member!.userId,
            "token": token
          }));
      if (response.statusCode == 200) {
        updateTokenModel = UpdateTokenModel.fromJson(response.data);
        if (updateTokenModel.success == 1) {
          print("updateToken sucsseful");
        } else {
          print("error updateToken");
        }
      }
    }
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
        "easyapproach",
        "easyapproach channel",
        // "this is our channel",
        importance: Importance.max,
        priority: Priority.high,
      ));

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
