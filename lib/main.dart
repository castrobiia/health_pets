//flutter run --no-sound-null-safety

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_pets/pages/cadastro-usuario.page.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/pages/editar-pet.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/pages/redefinir-senha.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';

import 'package:health_pets/firebase_messaging/custom_firebase_messaging.dart';
import 'package:health_pets/pages/login.page.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await CustomFirebaseMessaging().inicialize();

  await CustomFirebaseMessaging().getTokenFirebase();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      navigatorKey: navigatorKey,
      supportedLocales: [
        Locale('en', ''),
        Locale('pt', ''),
      ],
      title: 'Health Pets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const PetPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const CadastroUsuario(),
        '/reset': (context) => const ResetSenha(),
        '/calendario': (context) => const Calendario(),
        RedefinirSenha.routeName:(context) => const RedefinirSenha(),
        EditarPetPage.routeName: (context) => const EditarPetPage(),
      },
    );
  }
}

class Argumentos {
  final int? id;
  final String? token;
  final String? email;
  final String? password;
  final String? confirmation;

  Argumentos([this.id,this.token, this.email, this.password, this.confirmation]);
}


