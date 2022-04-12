//flutter run --no-sound-null-safety

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_pets/firebase_messaging/custom_firebase_messaging.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:splashscreen/splashscreen.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  //se certificando de que todas as plataformas foram inicializadas para iniciar a app
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();

  await CustomFirebaseMessaging().getTokenFirebase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Health Pets',
      //tirar o banner de debug da tela
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: _introScreen(),
    );
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 3,
        gradientBackground: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE5E5E5),
            Color(0xFFF6BD87),
            Color(0xFFE79F84),
            Color(0xFFEC9F94),
            Color(0xFFEB9B95),
            Color(0xFFE89A95),
            Color(0xFFDD9795),
            Color(0xFFCC9396),
            Color(0xFFB38C96),
            Color(0xFF9A8F9C),
            Color(0xFF9DA1A9),
            Color(0xFFB3B9C0)
          ],
        ),
        navigateAfterSeconds: LoginPage(),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: BoxDecorationImagem(400, "assets/logo_health_pets.png"),
      ),
    ],
  );
}
