//flutter run --no-sound-null-safety

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_pets/blocs/especie.bloc.dart';
import 'package:health_pets/blocs/home.bloc.dart';
import 'package:health_pets/blocs/raca.bloc.dart';
import 'package:health_pets/blocs/user.bloc.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:health_pets/firebase_messaging/custom_firebase_messaging.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();

  await CustomFirebaseMessaging().getTokenFirebase();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeBloc>.value(
          value: HomeBloc(),
        ),
        ChangeNotifierProvider<UserBloc>.value(
          value: UserBloc(),
        ),
        ChangeNotifierProvider<RacaBloc>.value(
          value: RacaBloc(),
        ),
        ChangeNotifierProvider<EspecieBloc>.value(
          value: EspecieBloc(),
        ),
      ],
      child: Main(),
    );
  }
}


class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
        Locale('pt', ''),],
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
            ColorTheme.branco1,
            ColorTheme.salmao1,
            ColorTheme.salmao2,
            ColorTheme.rosa1,
            ColorTheme.rosa2,
            ColorTheme.rosa3,
            ColorTheme.rosa4,
            ColorTheme.rosa5,
            ColorTheme.roxo1,
            ColorTheme.roxo2,
            ColorTheme.cinza1,
            ColorTheme.cinza2
          ],
        ),
        // navigateAfterSeconds: TabsPage(),
        navigateAfterSeconds: DefaultTabController(
          length: 3,
          child: LoginPage(),
        ),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: BoxDecorationImagem(400, "assets/logo_health_pets.png"),
      ),
    ],
  );
}



