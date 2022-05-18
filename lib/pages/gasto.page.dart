import 'package:flutter/material.dart';
import 'package:health_pets/pages/gasto-relatorio.page.dart';
import 'package:health_pets/pages/menu-gasto.page.dart';
import 'gasto-geral.page.dart';
import 'gasto-meta.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GastoPage extends StatefulWidget {
  @override
  State<GastoPage> createState() => _GastoPageState();
}

class _GastoPageState extends State<GastoPage> {
  _GastoPageState();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: AppLocalizations.of(context)!.overview,
              ),
              Tab(text: AppLocalizations.of(context)!.reports),
              Tab(text: AppLocalizations.of(context)!.goals),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.budget),
          elevation: 0,
          centerTitle: true,
          actions: [
          PopupMenuButton<MenuItemGasto>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItemsGasto.items.map(buildItem).toList(),
            ],
          ),
        ],
        ),
        body: TabBarView(
          children: <Widget>[
            GeraisGastos(),
            RelatoriosGastos(),
            MetaGasto(),
          ],
        ),
      ),
    );
  }
}
