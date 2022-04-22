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
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
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
                  color: Color(0xFFCC9396),
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
              decoration: boxDecoration(Color(0xFFCC9396)),
              child: TextButton(
                onPressed: () {
                  SnackBar(
                    action: SnackBarAction(label: 'Desfazer', onPressed: () {}),
                    content: Row(
                      children: <Widget>[
                        Icon(Icons.ac_unit_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text(AppLocalizations.of(context)!.emailSent),
                        ),
                      ],
                    ),
                  );
                  setarMaterialPageRoute(context, LoginPage());
                },
                child: textBotao(AppLocalizations.of(context)!.send),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
