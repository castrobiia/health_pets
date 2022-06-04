import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu-diario.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InformacaoDiario extends StatefulWidget {
  const InformacaoDiario({Key? key}) : super(key: key);

  @override
  InformacaoDiarioState createState() => InformacaoDiarioState();
}

class InformacaoDiarioState extends State<InformacaoDiario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   PopupMenuButton<MenuItemDiario>(
        //     onSelected: (item) => onSelected(context, item),
        //     itemBuilder: (context) => [
        //       ...MenuItemsDiario.items.map(buildItem).toList(),
        //     ],
        //   ),
        // ],
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.diaryTitle),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(AppLocalizations.of(context)!.diaryInformation),
        ),
      ),
    );
  }
}
