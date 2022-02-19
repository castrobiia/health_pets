import 'package:flutter/material.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/pages/home.page.dart';
import 'package:health_pets/pages/perfil-usuario.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/pages/vacinas.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          PetPage(),
          PerfilUsuario(),
          CalendarioPage(),
          VacinaPage(), //Só para visualização
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: new Icon(Icons.pets),
          ),
          Tab(
            icon: new Icon(Icons.person),
          ),
          Tab(
            icon: new Icon(Icons.calendar_today),
          ),
          Tab(
            icon: new Icon(Icons.attach_money),
            //auto_graph_outlined
          ),
        ],
      ),
    );
  }
}
