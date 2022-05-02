import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu-diario.page.dart';

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
        actions: [
          PopupMenuButton<MenuItemDiario>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItemsDiario.items.map(buildItem).toList(),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        title: Text("Título do Diário"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text('Informação Diário'),
        ),
      ),
    );
  }
}
