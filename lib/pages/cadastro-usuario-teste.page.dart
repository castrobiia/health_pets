import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/http/usuario-repository.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/models/usuario-model-teste.dart';
import 'package:health_pets/models/usuario-model.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:http/http.dart' as http;

class CadastroUsuarioTeste extends StatefulWidget {
  const CadastroUsuarioTeste({Key? key}) : super(key: key);

  @override
  State<CadastroUsuarioTeste> createState() => _CadastroUsuarioTesteState();
}

String mensagem = '';
Future<UsuarioModelTeste?> submitUsuario(String name, String email,
    String password, String password_confirmation) async {
  //const url = 'https://www.healthpets.app.br/api/auth/register';

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  final requestBody = jsonEncode({
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': password_confirmation,
  });

  final response = await http.post(
      Uri.https('healthpets.app.br', 'api/auth/register'),
      headers: requestHeaders,
      body: requestBody);

  Map mapResponse = jsonDecode(response.body);
  mensagem = mapResponse['message'];

  if (response.statusCode != 201) {}

  /* 
  final response1 = await http.post(Uri.parse(url), body: {
    'name': name,
    'email': email,
    'password': password,
    'password_confirmation': password_confirmation,
  }); */
  var statusCode = response.statusCode;
  var dadosUsuario = response.body;

  //Map<String, dynamic> decodedJson = jsonDecode(response.body);
  //final List<UsuarioJson> mensagemUsuario = decodedJson["message"];
  //print('mensagem usuário: ${mensagemUsuario}');
  print('VENDO OS DADOS DO USUÁRIO: ${statusCode}, ${dadosUsuario}');
}

class _CadastroUsuarioTesteState extends State<CadastroUsuarioTeste> {
  createInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Informações sobre a senha"),
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
            //height: double.maxFinite,
            //height: 500,
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
                        "Criar Conta",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF6BD87)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    //validator:
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        color: Color(0xFFCC9396),
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
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Color(0xFFCC9396),
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
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Color(0xFFCC9396),
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
                      labelText: "Confirmar Senha",
                      labelStyle: TextStyle(
                          color: Color(0xFFCC9396),
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
                      "Ao continuar, estou de acordo com as Termos de Uso e Políticas de Privacidade do Health Pets.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFCC9396),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      boxShadow: [
                        new BoxShadow(
                          //cor do fundo (em volta) do container
                          color: Colors.black12,
                          //qnt de sombra
                          offset: new Offset(1, 2.0),
                          //expansao da sombra
                          blurRadius: 5,
                          //intensidade da borda
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () async {
                        String nome = nomeController.text;
                        String email = emailController.text;
                        String senha = senhaController.text;
                        String confirmacaoSenha =
                            confirmacaoSenhaController.text;

                        UsuarioModelTeste dadosUsuario = (await submitUsuario(
                                nome, email, senha, confirmacaoSenha))
                            as UsuarioModelTeste;

                        setState(() {
                          _usuarioModelTeste = dadosUsuario;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(mensagem)));
                        setarMaterialPageRouteTab(context, TabsPage());
                      },
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
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
