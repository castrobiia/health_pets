import 'package:flutter/material.dart';
import 'package:health_pets/pages/relatorios-gastos.page.dart';
import 'gasto-meta.page.dart';
import 'informacoes-pet.page.dart';

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
                text: "Visão geral",
              ),
              Tab(text: "Relatórios"),
              Tab(text: " Metas"),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text("Gastos"),
          elevation: 0,
          centerTitle: true,
        ),
        body: TabBarView(
          children: <Widget>[
            InformacoesPet(),
            RelatoriosGastos(),
            MetaGasto(),
          ],
        ),
      ),
    );
  }
}
