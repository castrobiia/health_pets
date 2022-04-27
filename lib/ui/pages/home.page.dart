import 'package:flutter/material.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/pages/cadastro-animal.page.dart';
import 'package:provider/provider.dart';

import '../../blocs/home.bloc.dart';
import '../../widgets/animal/animal-list.widget.dart';
import '../../widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF6BD87),
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          setarMaterialPageRouteTab(context, CadastrarAnimalPage());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.pets),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: AnimalList(
          animais: bloc.animais as List<AnimalModel>,
        ),
      ) ,
    );
  }
}