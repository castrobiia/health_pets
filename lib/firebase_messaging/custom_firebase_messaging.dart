import 'package:health_pets/firebase_messaging/custom_local_notification.dart';
import 'package:health_pets/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomFirebaseMessaging{
  final CustomLocalNotification _customLocalNotification;


  CustomFirebaseMessaging._internal(this._customLocalNotification);
  static final CustomFirebaseMessaging _singleton = CustomFirebaseMessaging._internal(CustomLocalNotification());
  factory CustomFirebaseMessaging() => _singleton;

  Future<void> inicialize() async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true, sound: true);

    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if(notification != null && android != null){
        _customLocalNotification.androidNotification(notification, android);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if(message.data['goTo'] != null){
        navigatorKey.currentState?.pushNamed(message.data['goTo']);
      }
    });
  }

  // getTokenFirebase() async => debugPrint(await FirebaseMessaging.instance.getToken());
  getTokenFirebase() async {
    // debugPrint(await FirebaseMessaging.instance.getToken());
    var device = await FirebaseMessaging.instance.getToken();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('device_token', device!);
  }
}