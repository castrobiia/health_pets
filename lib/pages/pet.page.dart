import 'package:flutter/material.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/pages/cadastro-pet.page.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/pages/menu.page.dart';
import 'package:health_pets/widgets/pet/pet-list.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future autenticacao() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.get('token').toString();

      if (token == null || token == '') {
        setarMaterialPageRoute(context, LoginPage());
      }
      /* 
      var keyBox = await Hive.openBox('session');

      if (!keyBox.containsKey('key')) {
        print('não existe token');
        setarMaterialPageRoute(context, LoginPage());
      }
      print('existe token');
      setarMaterialPageRoute(context, PetPage());
      */
    }

    autenticacao();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF6BD87),
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          setarMaterialPageRouteTab(context, CadastrarPetPage());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Pets"),
        centerTitle: true,
        elevation: 1,
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.items.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: PetLista(),
            ),
          ),
        ],
      ),
    );
  }
}
