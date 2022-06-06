import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class RedefinirSenha extends StatefulWidget {
  static const routeName = '/redefinir';
  const RedefinirSenha();

  @override
  State<RedefinirSenha> createState() => _RedefinirSenhaState();
}

Future<void> reset(
    BuildContext context, String token, String email, String password, String confirmation) async {

  var response =
  await http.post(Uri.https('healthpets.app.br', 'api/auth/reset'), body: {
    'token': token,
    'email': email,
    'password': password,
    'password_confirmation': confirmation
  });

  Map mapResponse = jsonDecode(response.body);

  var status = response.statusCode;

  if (status != 200) {
    var error = mapResponse['message'];
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    Navigator.pushNamed(context, '/login');
  }
}

class _RedefinirSenhaState extends State<RedefinirSenha> {
  _RedefinirSenhaState();
  var password, password_confirm;
  createInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.information),
            content: Container(
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.passwordContent),
                  SizedBox(height: 15),
                  Text(AppLocalizations.of(context)!.uppercase),
                  SizedBox(height: 7),
                  Text(AppLocalizations.of(context)!.lowercase),
                  SizedBox(height: 7),
                  Text(AppLocalizations.of(context)!.number),
                  SizedBox(height: 7),
                  Text(AppLocalizations.of(context)!.specialCharacter),
                  SizedBox(height: 7),
                  Text(AppLocalizations.of(context)!.character),
                ],
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var args = jsonEncode(ModalRoute.of(context)?.settings.arguments);
    var argumentos = Map.from(jsonDecode(args));

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmationController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 220,
                height: 220,
                child: Image.asset("assets/reset-password.png"),
              ),
              Text(
                AppLocalizations.of(context)!.resetPassword,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ColorTheme.salmao1,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              setarCampoFormsObscure(passwordController, AppLocalizations.of(context)!.password, this.password, context, validator: (value) => validarCampo(value)),
              SizedBox(height: 20),
              setarCampoFormsObscure(confirmationController, AppLocalizations.of(context)!.confirmPassword, this.password_confirm,  context, validator: (value) => validarCampo(value)),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: boxDecoration(ColorTheme.rosa5),
                child: TextButton(
                  onPressed: () async {
                    reset(context, argumentos['token'].split('=')[1], argumentos['email'], passwordController.text, confirmationController.text);
                  },
                  child: textBotao(AppLocalizations.of(context)!.reset),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
