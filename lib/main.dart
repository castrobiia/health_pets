//flutter run --no-sound-null-safety

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_pets/pages/cadastro-usuario.page.dart';
import 'package:health_pets/pages/editar-pet.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/pages/redefinir-senha.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';

import 'package:health_pets/firebase_messaging/custom_firebase_messaging.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:uni_links/uni_links.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  //se certificando de que todas as plataformas foram inicializadas para iniciar a app
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
      supportedLocales: [
        Locale('en', ''),
        //Locale('es', ''),
        Locale('pt', ''),
      ],
      title: 'Health Pets',
      //tirar o banner de debug da tela
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
        RedefinirSenha.routeName:(context) => const RedefinirSenha(),
        EditarPetPage.routeName: (context) => const EditarPetPage(),
      },
      //Para usar as rotas :
      // Navigator.pushNamed(context, '/home');
      //jeito antigo
      //Navigator,push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
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

// Widget _introScreen() {
//   return Stack(
//     children: <Widget>[
//       SplashScreen(
//         seconds: 3,
//         gradientBackground: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             ColorTheme.branco1,
//             ColorTheme.salmao1,
//             ColorTheme.salmao2,
//             ColorTheme.rosa1,
//             ColorTheme.rosa2,
//             ColorTheme.rosa3,
//             ColorTheme.rosa4,
//             ColorTheme.rosa5,
//             ColorTheme.roxo1,
//             ColorTheme.roxo2,
//             ColorTheme.cinza1,
//             ColorTheme.cinza2
//           ],
//         ),
//         navigateAfterSeconds: LoginPage(),
//         loaderColor: Colors.transparent,
//       ),
//       Center(
//         child: BoxDecorationImagem(400, "assets/logo_health_pets.png"),
//       ),
//     ],
//   );
// }
