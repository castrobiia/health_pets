import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.pets),
        centerTitle: true,
        elevation: 1,
      ),
      body: PetLista(),
    );
  }
}
