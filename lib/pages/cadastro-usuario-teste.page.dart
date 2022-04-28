import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:http/http.dart' as http;

import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/usuario-model-teste.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login.page.dart';

class CadastroUsuarioTeste extends StatefulWidget {
  const CadastroUsuarioTeste({Key? key}) : super(key: key);

  @override
  State<CadastroUsuarioTeste> createState() => _CadastroUsuarioTesteState();
}

Future<UsuarioModelTeste?> submitUsuario(BuildContext context, String nome,
    String email, String password, String password_confirmation) async {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  final requestBody = jsonEncode({
    'nome': nome,
    'email': email,
    'password': password,
    'password_confirmation': password_confirmation,
  });

  final response = await http.post(
      Uri.https('healthpets.app.br', 'api/auth/register'),
      headers: requestHeaders,
      body: requestBody);
  Map<String, dynamic> list = json.decode(response.body);

  if (list['errors'] != null) {
    var msg = '';
    if (list['errors']["nome"] != null || list['errors']["nome"] == "") {
      msg += '\n' +
          list['errors']["nome"]
              .toString()
              .substring(1, list['errors']["nome"].toString().length - 1) +
          '\n';
    }
    if (list['errors']["email"] != null || list['errors']["email"] == "") {
      msg += list['errors']["email"]
              .toString()
              .substring(1, list['errors']["email"].toString().length - 1) +
          '\n';
    }
    if (list['errors']["password"] != null ||
        list['errors']["password"] == "") {
      msg += list['errors']["password"]
              .toString()
              .substring(1, list['errors']["password"].toString().length - 1) +
          '\n';
    }
    if (list['errors']["password_confirmation"] != null ||
        list['errors']["password_confirmation"] == "") {
      msg += list['errors']["password_confirmation"].toString().substring(
          1, list['errors']["password_confirmation"].toString().length - 1);
    }

    exibirMensagem(context, msg);
  } else {
    exibirMensagem(context, list['message']);
    setarMaterialPageRouteTab(context, LoginPage());
  }
}

class _CadastroUsuarioTesteState extends State<CadastroUsuarioTeste> {
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
                  Text("A senha deve conter, no mínimo:"),
                  SizedBox(height: 15),
                  Text('- 1 letra maiúscula'),
                  SizedBox(height: 7),
                  Text('- 1 letra minúscula'),
                  SizedBox(height: 7),
                  Text('- 1 número'),
                  SizedBox(height: 7),
                  Text('- 1 caractere especial'),
                  SizedBox(height: 7),
                  Text('- 8 caracteres'),
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

  //UsuarioRepository _repository;

  late UsuarioModelTeste _usuarioModelTeste;
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();

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
                            color: ColorTheme.salmao1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.name,
                      labelStyle: TextStyle(
                        color: ColorTheme.rosa5,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    controller: nomeController,
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
                        color: ColorTheme.rosa5,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10,
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
                    controller: senhaController,
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
                          color: ColorTheme.rosa5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                    controller: confirmacaoSenhaController,
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
                    decoration: boxDecoration(ColorTheme.rosa5),
                    child: TextButton(
                      onPressed: () async {
                        String nome = nomeController.text;
                        String email = emailController.text;
                        String senha = senhaController.text;
                        String confirmacaoSenha =
                            confirmacaoSenhaController.text;

                        RegExp senhaExp = new RegExp(
                          r"^(?=.*[A-Z])(?=.*[!#@$%&])(?=.*[0-9])(?=.*[a-z]).{6,15}$",
                          caseSensitive: true,
                        );
                        bool resultado = senhaExp.hasMatch(senha);

                        if (resultado) {
                          UsuarioModelTeste dadosUsuario = (await submitUsuario(
                              context,
                              nome,
                              email,
                              senha,
                              confirmacaoSenha)) as UsuarioModelTeste;
                          setState(() {
                            _usuarioModelTeste = dadosUsuario;
                          });
                        } else {
                          exibirMensagem(context,
                              'A senha não cumpre os requisitos. Para saber mais, clique no ícone de informação no campo Senha.');
                        }
                      },
                      child: textBotao(AppLocalizations.of(context)!.save),
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
