import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu-pet-compartilhado.page.dart';
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
        title: Text(AppLocalizations.of(context)!.pets),
        centerTitle: true,
        elevation: 1,
        actions: [
          PopupMenuButton<MenuItemPetCompartilhado>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItemsPetCompartilhado.items.map(buildItem).toList(),
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
