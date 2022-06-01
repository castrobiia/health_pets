import 'package:flutter/material.dart';
import 'package:health_pets/repository/senha-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetSenha extends StatefulWidget {
  const ResetSenha({Key? key}) : super(key: key);

  @override
  State<ResetSenha> createState() => _ResetSenhaState();
}

class _ResetSenhaState extends State<ResetSenha> {
  final _formKey = GlobalKey<FormState>();
  String? _email;

  TextEditingController emailController = TextEditingController();

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
          decoration: boxDecoration(Colors.white),
          child: Form(
            key: _formKey,
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
                setarCampoForms(emailController,
                    AppLocalizations.of(context)!.email, _email,
                    validator: (value) => validarCampo(value)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: boxDecoration(ColorTheme.rosa5),
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String email = emailController.text;

                        if (await SenhaRepository().postEsqueceuSenha(email) ==
                            200) {
                          exibirMensagem(
                              context, AppLocalizations.of(context)!.emailSent);
                          setarMaterialPageRoute(context, LoginPage());
                        } else {
                          exibirMensagem(context,
                              'Não foi possível enviar e-mail para redefir a senha');
                        }
                      }
                    },
                    child: textBotao(AppLocalizations.of(context)!.send),
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
