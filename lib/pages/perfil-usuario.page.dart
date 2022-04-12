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

                  // add else calculando idade
                  if (usuario['data_nascimento'] == null ||
                      usuario['data_nascimento'] == '') {
                    idade = '-';
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //carregar imagem
                      BoxDecorationImagem(200, "assets/perfil-usuario1.png"),
                      Text(
                        usuario['name'] ?? '',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      setarRowPerfil("Email", usuario['email'] ?? ''),
                      divider(),
                      setarRowPerfil("Data de Nascimento",
                          usuario['data_nascimento'] ?? 'Não informada'),
                      divider(),
                      setarRowPerfil("Idade", idade),
                      divider(),
                      // alterar
                      setarRowPerfil("Animais", "5"),
                      divider(),
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
