//flutter run --no-sound-null-safety
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
            // #E5E5E5 0%, #F6BD87 8.54%, #E79F84 24.32%, #EC9F94 40.68%, #EB9B95 58.38%, #E89A95 65.44%, #DD9795 71.43%, #CC9396 77.03%, #B38C96 82.39%, #9A8F9C 87.59%, #9DA1A9 92.59%, #B3B9C0 96.37%
            //E5E5E5 100%, F6BD87 100%, EDAB85 100%
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
        child: Container(
          width: 400.0,
          height: 400.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/logo_health_pets.png"),
            ),
          ),
          //child: Image.asset("assets/logo.png"),
        ),
      ),
    ],
  );
}
