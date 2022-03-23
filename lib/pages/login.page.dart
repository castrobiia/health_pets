import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/models/login-model.dart';
import 'package:health_pets/pages/cadastro-usuario-teste.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';
import 'package:health_pets/pages/tabs.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<LoginModel?> login(String email, String password) async {
  //const url = 'https://www.healthpets.app.br/api/auth/login';

  /*
  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  }; */

  var response =
      await http.post(Uri.https('healthpets.app.br', 'api/auth/login'), body: {
    'email': email,
    'password': password,
  });


  print('Retorno do login------');
  print('RESPONSE STATUS CODE: ${response.statusCode}');

  print('RESPONSE BODY: ${response.body}');

  Map mapResponse = jsonDecode(response.body);

  var status = response.statusCode;

  var mensagemErro = 'Erro';

  Future _status(BuildContext context) async {
    if (status != 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagemErro)));
    }
  }

  //String mensagem = mapResponse['message'];
  String token = mapResponse['access_token'];

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

class _LoginPageState extends State<LoginPage> {
  late LoginModel _loginModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkedValue = true;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
          ),
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
              Container(
                //padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                //corrigindo o bug de
                height: double.maxFinite,

                //padding para os campos do form
                child: Padding(
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
                              return "E-mail inválido";
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input!,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(
                              color: Color(0xFFCC9396),
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ),
                            /*
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true, */
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
                              return "Senha inválida";
                            }
                            return null;
                          },
                          onSaved: (input) => _senha = input!,
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                                color: Color(0xFFCC9396),
                                fontWeight: FontWeight.w400,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CheckboxListTile(
                          title: Text(
                            "Lembrar-me",
                            style: TextStyle(color: Colors.grey),
                          ),
                          value: checkedValue,
                          onChanged: (newValue) {
                            setState(() {
                              checkedValue = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        ),
                        SizedBox(height: 20),
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
                              //faz a validação do formulário
                              if (_formKey.currentState!.validate()) {
                                //salvar o estado do formulário
                                _formKey.currentState!.save();

                                String email = emailController.text;
                                String password = passwordController.text;

                                LoginModel loginUsuario =
                                    (await login(email, password))
                                        as LoginModel;

                                setState(() {
                                  _loginModel = loginUsuario;
                                });

                                print('email: $email e senha: $password');

                                /*
                                var response =
                                    await LoginModel(email, password); */

                                /* ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Bem vindo(a), $_email"))); */

                                setarMaterialPageRouteTab(context, TabsPage());
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
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
                              "Esqueceu sua senha?",
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
                              "Criar conta",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /* Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 100,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Divider(
                      height: 2,
                      color: Colors.black12,
                      thickness: 2,
                    )
                  ],
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
/*
  String? _validaLogin(String value) {
    if (value.isEmpty) {
      return "E-mail inválido";
    }
    if (value.length < 8) {
      return "O campo deve ter no mínimo 8 caracteres"
    }
    return null;
  }
  */
}
