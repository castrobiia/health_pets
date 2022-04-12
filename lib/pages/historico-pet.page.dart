import 'package:flutter/material.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/vacinas.page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoricoPet extends StatefulWidget {
  //const HistoricoPet({Key? key}) : super(key: key);

  HistoricoPet(this.dia, this.peso, this.id);

  final String dia;
  final double peso;
  final int id;

  @override
  _HistoricoPetState createState() => _HistoricoPetState(id);
}

class _HistoricoPetState extends State<HistoricoPet> {
  final int id;

  _HistoricoPetState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              height: 500,
              decoration: boxDecoration(Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) => VacinaPage(id),
                            ),
                          );
                        }, // Image tapped
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/injection.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Vacinas",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VacinaPage(id), //corrigir
                            ),
                          );
                        }, // Image tapped
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/microscope.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Exames",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  VacinaPage(id), //corrigir
                            ),
                          );
                        }, // Image tapped
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/veterinarian.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Consultas",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title: ChartTitle(text: "Peso"),
                    series: <ChartSeries<HistoricoPet, String>>[
                      LineSeries<HistoricoPet, String>(
                          dataSource: <HistoricoPet>[
                            HistoricoPet('13/01/2022', 20, id),
                            HistoricoPet('13/02/2022', 30, id),
                            HistoricoPet('13/03/2022', 10, id),
                            HistoricoPet('13/04/2022', 15, id),
                            HistoricoPet('13/05/2022', 30, id),
                            HistoricoPet('13/06/2022', 40, id),
                          ],
                          xValueMapper: (HistoricoPet peso, _) => peso.dia,
                          yValueMapper: (HistoricoPet peso, _) => peso.peso,
                          dataLabelSettings:
                              DataLabelSettings(isVisible: true)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
