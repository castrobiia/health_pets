import 'package:flutter/material.dart';
import 'package:health_pets/pages/historico-pet.page.dart';
import 'package:health_pets/pages/informacoes-pet.page.dart';
import 'package:health_pets/pages/menu-pet.page.dart';
import 'package:health_pets/pages/perfil-pet.page.dart';

class PerfilPetPage extends StatefulWidget {
  final id;
  const PerfilPetPage(this.id);

  @override
  State<PerfilPetPage> createState() => _PerfilPetPageState(this.id);
}

class _PerfilPetPageState extends State<PerfilPetPage> {
  final id;
  _PerfilPetPageState(this.id);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Perfil",
              ),
              Tab(text: " Histórico"),
              Tab(text: " Informações"),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text("Sobre o Pet"),
          elevation: 0,
          centerTitle: true,
          actions: [
            PopupMenuButton<MenuItemPet>(
              onSelected: (item) => onSelected(context, item, id),
              itemBuilder: (context) => [
                ...MenuItemsPet.items.map(buildItem).toList(),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            PerfilPet(id),
            HistoricoPet("dia", 10),
            InformacoesPet()
          ],
        ),
      ),
    );
  }
}
