import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomLocalNotification{
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  CustomLocalNotification(){
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications',
      importance: Importance.max,
    );

    _configuraAndroid().then(
        (value){
          flutterLocalNotificationsPlugin = value;
          inicializeNotifications();
        },
    );
  }

  Future<FlutterLocalNotificationsPlugin> _configuraAndroid() async{
    var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    
    return flutterLocalNotificationsPlugin;
  }
  
  inicializeNotifications(){
    //icone que vaia aprecer na notificação. Ele fica no Android Manisfest.xml android:icon="..."
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: android),
    );
  }
  
  androidNotification(RemoteNotification notification,AndroidNotification android){
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id,
              channel.name,
            channelDescription: channel.description,
            icon: android.smallIcon,
          ),
        ),
    );
  }

}