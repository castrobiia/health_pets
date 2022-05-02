import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetSenha extends StatelessWidget {
  const ResetSenha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                AppLocalizations.of(context)!.forgotPassword,
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
              Text(
                AppLocalizations.of(context)!.informationRecovery,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
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
                height: 30,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: boxDecoration(ColorTheme.rosa5),
                child: TextButton(
                  onPressed: () {
                    exibirMensagem(
                        context, AppLocalizations.of(context)!.emailSent);

                    setarMaterialPageRoute(context, LoginPage());
                  },
                  child: textBotao(AppLocalizations.of(context)!.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
