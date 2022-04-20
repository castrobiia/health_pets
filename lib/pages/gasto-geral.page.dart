import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    return PieChart(
      dataMap: categorias,
      animationDuration: Duration(milliseconds: 1200),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      //colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: true,
        //legendShape: _BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
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
