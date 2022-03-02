import 'package:flutter/material.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/pages/cadastro-usuario.page.dart';
import 'package:health_pets/pages/reset-senha.page.dart';
import 'package:health_pets/pages/tabs.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkedValue = true;
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          //para o background gradiente
          decoration: new BoxDecoration(
            //color: Color(0x62F6BD87),
            color: Colors.white,
            /* gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // #E5E5E5 0%, #F6BD87 8.54%, #E79F84 24.32%, #EC9F94 40.68%, #EB9B95 58.38%, #E89A95 65.44%, #DD9795 71.43%, #CC9396 77.03%, #B38C96 82.39%, #9A8F9C 87.59%, #9DA1A9 92.59%, #B3B9C0 96.37%
                //E5E5E5 100%, F6BD87 100%, EDAB85 100%
                Color(0xFFE5E5E5),
                Color(0xFFF6BD87),
                Color(0xFFE79F84),
                Color(0xFFEC9F94),
                Color(0xFFEB9B95),
                Color(0xFFE89A95),
                Color(0xFFDD9795),
                Color(0xFFCC9396),
                Color(0xFFB38C96),
                Color(0xFF9A8F9C),
                Color(0xFF9DA1A9),
                Color(0xFFB3B9C0)
              ],
            ), */
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
                            onPressed: () {
                              //faz a validação do formulário
                              if (_formKey.currentState!.validate()) {
                                //salvar o estado do formulário
                                _formKey.currentState!.save();

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
                                  context, CadastroUsuario());
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
}
