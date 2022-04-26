import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/blocs/user.bloc.dart';
import 'package:health_pets/models/authenticate.model.dart';
import 'package:provider/provider.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/cadastro-usuario-teste.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../settings.dart';

import '../themes/color_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey =  GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var auth = new AuthenticateModel();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 40),
            //coluna para colocar a imagem e o form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //logo
                SizedBox(
                  height: 220,
                  width: 220,
                  child: Image.asset("assets/logo_health_pets.png"),
                ),
                //form (estilizacao)
                Container(
                  //corrigindo o bug de
                  height: double.maxFinite,

                  //padding para os campos do form
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        //para a coluna ocupar to-do o container
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return (AppLocalizations.of(context)!.invalidEmail);
                              }
                              return null;
                            },
                            onSaved: (value) => auth.email = value!,
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
                                return (AppLocalizations.of(context)!.invalidPassword);
                              }
                              return null;
                            },
                            onSaved: (value) {
                              auth.password = value!;
                            },
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

                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  var user = await context.read<UserBloc>().authenticate(auth);
                                    if(user != null){
                                      Settings.user = user;
                                      setarMaterialPageRoute(context, TabsPage());
                                    }
                                    final snackBar = SnackBar(content: Text("Usuario ou senha invalidos!"));
                                    _scaffoldKey.currentState?.showSnackBar(snackBar);
                                }
                              },
                              child: textBotao(AppLocalizations.of(context)!.login),
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
                                AppLocalizations.of(context)!.forgotPassword
                              ),
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
                                AppLocalizations.of(context)!.createAccount
                              ),
                            ),
                          ),
                        ],
                      ),
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
