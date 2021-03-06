import 'package:flutter/material.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/pages/perfil-usuario.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../arquivado/gasto.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            PetPage(),
            //GastoPage(),
            Calendario(),
            PerfilUsuario(),
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              icon: new Icon(Icons.pets),
            ),
            // Tab(
            //   icon: new Icon(Icons.attach_money),
            // ),
            Tab(
              icon: new Icon(Icons.calendar_today),
            ),
            Tab(
              icon: new Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
