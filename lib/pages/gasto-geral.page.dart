import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/widgets.dart';
import 'cadastro-gasto.page.dart';

class GeraisGastos extends StatelessWidget {
  Map<String, double> categorias = {
    "Alimentação": 5,
    "Higiene": 3,
    "Despesas médicas": 2,
    "Lazer e Diversão": 2,
    "Acessórios": 2,
    "Outros": 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF6BD87),
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          setarMaterialPageRouteTab(context, CadastrarGastoPage());
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  "Despesas por categoria",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50.0),
                _graficoCategoria(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PieChart _graficoCategoria(context) {
    return PieChart(
      dataMap: categorias,
      animationDuration: const Duration(milliseconds: 1200),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      //colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: const LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        //legendShape: _BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: true,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
