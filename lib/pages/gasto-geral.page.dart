// /// Donut chart example. This is a simple pie chart with a hole in the middle.
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
import 'package:pie_chart/pie_chart.dart';

class DonutPieChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   final bool animate;

  DonutPieChart();
  //DonutPieChart(this.seriesList, {required this.animate});

//   /// Creates a [PieChart] with sample data and no transition.
//   factory DonutPieChart.withSampleData() {
//     return new DonutPieChart(
//       _createSampleData(),
//       // Disable animations for image tests.
//       animate: true,
//     );
//   }

Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      //colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "HYBRID",
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
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
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );

    
  }
  



//     return new charts.PieChart(seriesList,
//         animate: animate,
//         // Configure the width of the pie slices to 60px. The remaining space in
//         // the chart will be left as a hole in the center.
//         defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
//   }

//   /// Create one series with sample hard coded data.
//   static List<charts.Series<LinearSales, int>> _createSampleData() {
//     final data = [
//       new LinearSales(0, 100),
//       new LinearSales(1, 75),
//       new LinearSales(2, 25),
//       new LinearSales(3, 5),
//     ];

//     return [
//       new charts.Series<LinearSales, int>(
//         id: 'Sales',
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
}

// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }




