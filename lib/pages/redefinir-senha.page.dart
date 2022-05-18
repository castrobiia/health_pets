import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RedefinirSenha extends StatefulWidget {
  const RedefinirSenha({Key? key}) : super(key: key);

  @override
  State<RedefinirSenha> createState() => _RedefinirSenhaState();
}

class _RedefinirSenhaState extends State<RedefinirSenha> {
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
              TextField(
                autofocus: false,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      createInfoDialog(context);
                    },
                    icon: Icon(Icons.info),
                  ),
                  labelText: AppLocalizations.of(context)!.password,
                  labelStyle: TextStyle(
                    color: ColorTheme.rosa5,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.confirmPassword,
                  labelStyle: TextStyle(
                    color: ColorTheme.rosa5,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: boxDecoration(ColorTheme.rosa5),
                child: TextButton(
                  onPressed: () {
                    exibirMensagem(context,
                        AppLocalizations.of(context)!.resetPasswordSend);

                    setarMaterialPageRoute(context, LoginPage());
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
