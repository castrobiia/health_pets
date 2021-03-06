import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/login-model.dart';
import 'package:health_pets/pages/cadastro-usuario-teste.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uni_links/uni_links.dart';
import 'package:uni_links/uni_links.dart';

import '../themes/color_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<LoginModel?> login(
    BuildContext context, String email, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var deviceToken = prefs.getString('device_token');
  print('Making Login $deviceToken');

  var response =
      await http.post(Uri.https('healthpets.app.br', 'api/auth/login'), body: {
    'email': email,
    'password': password,
    'device_token': deviceToken,
  });

  Map mapResponse = jsonDecode(response.body);

  var status = response.statusCode;

  if (status == 401) {
    var error = mapResponse['error'];
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    String token = mapResponse['access_token'];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    setarMaterialPageRouteTab(context, PetPage());
  }
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel _loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _senha;
  StreamSubscription? _sub;

  Future<void>  initUniLinks() async {
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        print('Esta ouvindo os links');
        var uri = Uri.parse(link);
        if (uri.queryParameters['token'] != null &&
            uri.queryParameters['email'] != null) {
          print('Resete de senha completo');
          // navigatorKey.currentState?.pushNamed('/reset');
          Navigator.pushNamed(
              context,
              '/redefinir',
              arguments: {
                'token': uri.queryParameters['token'],
                'email': uri.queryParameters['email']
              }
          );
        }
      }
    }, onError: (err) {

    }
    );
  }

    @override
    Widget build(BuildContext context) {
      initUniLinks();
      return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 40),
              //coluna para colocar a imagem e o form
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //logo
                  SizedBox(
                    height: 220,
                    width: 220,
                    child: Image.asset("assets/logo_health_pets.png"),
                  ),
                  //form (estilizacao)
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //para a coluna ocupar todo o container
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return (AppLocalizations.of(context)!
                                    .invalidEmail);
                              }
                              return null;
                            },
                            onSaved: (input) => _email = input!,
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.email,
                              labelStyle: TextStyle(
                                color: ColorTheme.rosa5,
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return (AppLocalizations.of(context)!
                                    .invalidPassword);
                              }
                              return null;
                            },
                            onSaved: (input) => _senha = input!,
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!.password,
                              labelStyle: TextStyle(
                                  color: ColorTheme.rosa5,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            decoration: boxDecoration(ColorTheme.rosa5),
                            child: TextButton(
                              onPressed: () async {
                                //faz a valida????o do formul??rio
                                if (_formKey.currentState!.validate()) {
                                  //salvar o estado do formul??rio
                                  _formKey.currentState!.save();

                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  LoginModel loginUsuario =
                                  // (await login(context, email, password, device_token!))
                                  (await login(context, email, password))
                                  as LoginModel;

                                  setState(
                                        () {
                                      _loginModel = loginUsuario;
                                    },
                                  );
                                }
                              },
                              child:
                              textBotao(AppLocalizations.of(context)!.login),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            //color: Colors.grey,
                            height: 40,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                setarMaterialPageRoute(context, ResetSenha());
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.forgotPassword),
                            ),
                          ),
                          Container(
                            //color: Colors.grey,
                            height: 40,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                setarMaterialPageRoute(
                                    context, CadastroUsuarioTeste());
                              },
                              child: Text(
                                  AppLocalizations.of(context)!.createAccount),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
