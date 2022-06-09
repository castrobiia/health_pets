import 'package:flutter/material.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/pages/editar-usuario.page.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/cadastro-pet.page.dart';
import 'package:health_pets/widgets/pet/pet-list.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    autenticacao(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ColorTheme.salmao1,
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          setarMaterialPageRouteTab(context, CadastrarPetPage());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Text(AppLocalizations.of(context)!.pets),
        centerTitle: true,
        elevation: 1,
      ),
      drawer: Drawer(
        child: FutureBuilder<dynamic>(
          future: UsuarioRepository().getUsuario(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                  child: Container(child: CircularProgressIndicator()));
            }
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  child: Text(AppLocalizations.of(context)!.errorLoading),
                ),
              );
            }
            final usuario = snapshot.data["user"];
            final qntdAnimais = snapshot.data["animais"];
            return Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // UserAccountsDrawerHeader(
                //   arrowColor: Colors.pink,
                //   accountName: Text(usuario['nome'] ?? ''),
                //   accountEmail: Text(usuario['email'] ?? ''),
                //   margin: EdgeInsets.only(bottom: 20),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  width: double.maxFinite,
                  color: ColorTheme.salmao1,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        usuario['nome'] ?? '',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(usuario['email'] ?? ''),
                      SizedBox(height: 5),
                      Text('Animais: ${qntdAnimais.toString()}'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: const Text('Editar Perfil'),
                  onTap: () {
                    setarMaterialPageRoute(context, EditarUsuario());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: const Text('Excluir Conta'),
                  onTap: () {
                    confirmarExclusaoUsuario(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: const Text('Sair'),
                  onTap: () {
                    setarMaterialPageRoute(context, LogoutPage());
                  },
                ),
                Divider(color: Colors.black87),
                ListTile(
                  leading: Icon(Icons.pets),
                  title: const Text('Pets'),
                  onTap: () {
                    setarMaterialPageRoute(context, PetPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: const Text('Calendário'),
                  onTap: () {
                    setarMaterialPageRoute(context, Calendario());
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: PetLista(),
    );
  }
}
