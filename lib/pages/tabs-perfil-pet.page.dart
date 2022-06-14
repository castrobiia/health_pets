import 'package:flutter/material.dart';
import 'package:health_pets/pages/saude-pet.page.dart';
import 'package:health_pets/pages/menu-pet.page.dart';
import 'package:health_pets/pages/informacao-outros.page.dart';
import 'package:health_pets/pages/perfil-pet.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              Tab(text: AppLocalizations.of(context)!.profile),
              Tab(text: AppLocalizations.of(context)!.health),
              Tab(text: AppLocalizations.of(context)!.others),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.aboutPet),
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
            SaudePet("dia", 10, id),
            OutrasCategorias()
          ],
        ),
      ),
    );
  }
}
