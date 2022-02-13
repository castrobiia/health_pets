import 'package:flutter/material.dart';
import 'package:health_pets/pages/historico-pet.page.dart';
import 'package:health_pets/pages/menu-pet.page.dart';
import 'package:health_pets/pages/perfil-pet.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';

class PerfilPetPage extends StatelessWidget {
  const PerfilPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFF6BD87),
          //cor do ícone
          foregroundColor: Colors.white,
          onPressed: () {},
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                //icon: Icon(Icons.android),
                text: "Perfil",
              ),
              Tab(
                  //icon: Icon(Icons.phone_iphone),
                  text: " Histórico"),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text("Sobre o Pet"),
          elevation: 0,
          centerTitle: true,
          actions: [
            PopupMenuButton<MenuItemPet>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItemsPet.items.map(buildItem).toList(),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            PerfilPet(),
            HistoricoPet("dia", 10), //alterar depois com o histórico
          ],
        ),
      ),
    );
  }
}
