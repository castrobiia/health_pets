import 'package:flutter/material.dart';

import '../models/relatorio-model.dart';
import '../themes/color_theme.dart';
import '../widgets/lista_gastos.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutrasCategorias extends StatefulWidget {
  const OutrasCategorias({Key? key}) : super(key: key);

  @override
  State<OutrasCategorias> createState() => _OutrasCategoriasState();
}

class _OutrasCategoriasState extends State<OutrasCategorias> {
  int filterHistory = 0;

  @override
  Widget build(BuildContext context) {
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
      child: ExpansionTile(
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
            children: incomeTransaction
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListaGastos(
                      transaction: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Card _buildAccessories() {
    return Card(
      child: ExpansionTile(
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
            children: expensesTransaction
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListaGastos(
                      transaction: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Card _buildHygiene() {
    return Card(
      child: ExpansionTile(
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
            children: incomeTransaction
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListaGastos(
                      transaction: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Card _buildleisureFun() {
    return Card(
      child: ExpansionTile(
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
            children: incomeTransaction
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListaGastos(
                      transaction: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
