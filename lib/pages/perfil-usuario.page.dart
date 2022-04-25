import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu-usuario.page.dart';
// Todo descomentar para voltar ao estado principal. import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.myProfile),
        elevation: 1,
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItemUsuario>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItemsUsuario.items.map(buildItem).toList(),
            ],
          ),
        ],
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
              //decoration: boxDecoration(Colors.white),
              // Todo descomentar para voltar ao estado principal. child: FutureBuilder<dynamic>(
              //   future: UsuarioRepository().getUsuario(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState != ConnectionState.done) {
              //       return Center(
              //           child: Container(child: CircularProgressIndicator()));
              //     }
              //     if (snapshot.hasError) {
              //       return Center(
              //         child: Container(
              //           child: Text(AppLocalizations.of(context)!.errorLoading),
              //         ),
              //       );
              //     }
              //     final usuario = snapshot.data;
              //
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: <Widget>[
              //         //carregar imagem
              //         BoxDecorationImagem(200, "assets/perfil-usuario1.png"),
              //         Text(
              //           usuario['name'] ?? '',
              //           style: TextStyle(
              //               fontSize: 23, fontWeight: FontWeight.bold),
              //         ),
              //         SizedBox(
              //           height: 15,
              //         ),
              //         setarRowPerfil(AppLocalizations.of(context)!.email, usuario['email'] ?? ''),
              //         divider(),
              //         // alterar
              //         setarRowPerfil(AppLocalizations.of(context)!.animals, "5"),
              //         divider(),
              //       ],
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
