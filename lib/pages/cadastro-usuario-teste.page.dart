import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/blocs/user.bloc.dart';
import 'package:health_pets/models/user-cadastro-model.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../settings.dart';
import 'login.page.dart';

class CadastroUsuarioTeste extends StatefulWidget {
  @override
  State<CadastroUsuarioTeste> createState() => _CadastroUsuarioTesteState();
}


class _CadastroUsuarioTesteState extends State<CadastroUsuarioTeste> {
  final _formKey =  GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var user = new UserCadastroModel();

  //Controllers
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();


  createInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.information),
            content: Text("Teste 2"),
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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF6BD87)),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.name,
                            labelStyle: TextStyle(
                              color: Color(0xFFCC9396),
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                          controller: nomeController,
                          onSaved: (value){
                            user.nome = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
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
                          controller: emailController,
                          onSaved: (value){
                            user.email = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
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
                              color: Color(0xFFCC9396),
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                          ),
                          controller: senhaController,
                          onSaved: (value){
                            user.password = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.confirmPassword,
                            labelStyle: TextStyle(
                                color: Color(0xFFCC9396),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                          controller: confirmacaoSenhaController,
                          onSaved: (value){
                            user.passwordConfirmation = value!;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.term,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: boxDecoration(Color(0xFFCC9396)),
                          child: TextButton(
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                var res = await context.read<UserBloc>().create(user);
                                if(res != null){
                                  setarMaterialPageRoute(context, LoginPage());
                                }
                                final snackBar = SnackBar(content: Text("Informações incorretas! Verifique e tente novamente!"));
                                _scaffoldKey.currentState?.showSnackBar(snackBar);
                              }
                            },
                            child: textBotao(AppLocalizations.of(context)!.save),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
