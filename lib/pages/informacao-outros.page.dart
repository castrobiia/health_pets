import 'package:flutter/material.dart';

import '../models/relatorio-model.dart';
import '../repository/informacao-repository.dart';
import '../themes/color_theme.dart';
import '../widgets/informacao/lista_outros.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutrasCategorias extends StatefulWidget {
  final int id;

  const OutrasCategorias(this.id);

  @override
  State<OutrasCategorias> createState() => _OutrasCategoriasState(this.id);
}

class _OutrasCategoriasState extends State<OutrasCategorias> {
  final int id;

  _OutrasCategoriasState(this.id);

  int filterHistory = 0;
  var food;
  var accessories;
  var fun;
  var hygiene;

  void getInformacaoComida(id) async {
    fun = await InformacaoRepository().getInfoFun(id);
    accessories = await InformacaoRepository().getInfoAccessories(id);
    fun = await InformacaoRepository().getInfoHygiene(id);
  }

  @override
  Widget build(BuildContext context) {
    getInformacaoComida(id);

    print(food);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                _buildFood(),
                const SizedBox(height: 24.0),
                _buildAccessories(),
                const SizedBox(height: 24.0),
                _buildHygiene(),
                const SizedBox(height: 24.0),
                _buildleisureFun(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card _buildFood() {
    return Card(
      child: FutureBuilder(
          future: InformacaoRepository().getInfoFood(id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            ;

            return ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.food,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorTheme.salmao2,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.food_bank, //dining
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              children: [
                Column(
                    children: food
                        .map<Widget>(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: ListaOutros(item),
                          ),
                        )
                        .toList()),
              ],
            );
          }),
      //
    );
  }

  Card _buildAccessories() {
    return Card(
      child: FutureBuilder(
          future: InformacaoRepository().getInfoAccessories(id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            ;

            return ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.accessories,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorTheme.salmao2,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.shopping_bag, //military_tech
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              children: [
                Column(
                    children: accessories
                        .map<Widget>(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: ListaOutros(item),
                          ),
                        )
                        .toList()),
              ],
            );
          }),
      //
    );
  }

  Card _buildHygiene() {
    return Card(
      child: FutureBuilder(
          future: InformacaoRepository().getInfoAccessories(id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            ;

            return ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                title: Text(
                  AppLocalizations.of(context)!.hygiene,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorTheme.salmao2,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.bubble_chart, //wash
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
                children: [
                  Column(
                      children: accessories
                          .map<Widget>(
                            (item) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 16.0,
                              ),
                              child: ListaOutros(item),
                            ),
                          )
                          .toList()),
                ]);
          }),
      //
    );
  }

  Card _buildleisureFun() {
    return Card(
      child: FutureBuilder(
          future: InformacaoRepository().getInfoAccessories(id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            ;

            return ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              title: Text(
                AppLocalizations.of(context)!.leisureFun,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: ColorTheme.salmao2,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.pest_control_rodent, //eco
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
              children: [
                Column(
                    children: fun
                        .map<Widget>(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: ListaOutros(item),
                          ),
                        ).toList()),
              ],
            );
          }),
      //
    );
  }
}
