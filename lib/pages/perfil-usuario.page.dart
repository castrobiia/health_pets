import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/usuario-entity.dart';
import 'package:health_pets/widgets/widgets.dart';

class PerfilUsuario extends StatefulWidget {
  const PerfilUsuario({Key? key}) : super(key: key);

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Meu Perfil"),
        elevation: 1,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              width: double.infinity,
              height: 450,
              decoration: boxDecoration(Colors.white),
              child: FutureBuilder<dynamic>(
                future: UsuarioEntity().getUsuario(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    // return: show loading widget
                    //todo mostrar o loading
                    return Center(
                        child: Container(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    // return: show error widget
                    return Center(
                      child: Container(
                        child: Text('Erro ao carregar os dados'),
                      ),
                    );
                  }
                  final usuario = snapshot.data;
                  var idade;

                  print('usuario: $usuario');

                  // add else calculando idade
                  if (usuario['data_nascimento'] == null ||
                      usuario['data_nascimento'] == '') {
                    idade = '-';
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      BoxDecorationImagem(200, "assets/perfil-usuario1.png"),
                      Text(
                        usuario['name'] ?? '',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "E-mail",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(usuario['email'] ?? ''),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Data de Nascimento",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(usuario['data_nascimento'] ?? 'Não informada'),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Idade",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(idade),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Animais",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("5"),
                        ],
                      ),
                      Divider(
                        height: 1,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
