import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoricoPet extends StatefulWidget {
  //const HistoricoPet({Key? key}) : super(key: key);

  HistoricoPet(this.dia, this.peso);

  final String dia;
  final double peso;

  @override
  _HistoricoPetState createState() => _HistoricoPetState();
}

class _HistoricoPetState extends State<HistoricoPet> {
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  new BoxShadow(
                    //cor do fundo (em volta) do container
                    color: Colors.black12,
                    //qnt de sombra
                    offset: new Offset(1, 2.0),
                    //expansao da sombra
                    blurRadius: 5,
                    //intensidade da borda
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
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
                          )
                        ],
                      ),
                      Column(
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
                            "2",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Column(
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
                          )
                        ],
                      ),
                    ],
                  ),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title: ChartTitle(text: "Peso"),
                    series: <ChartSeries<HistoricoPet, String>>[
                      LineSeries<HistoricoPet, String>(
                          dataSource: <HistoricoPet>[
                            HistoricoPet('13/01/2022', 20),
                            HistoricoPet('13/02/2022', 30),
                            HistoricoPet('13/03/2022', 10),
                            HistoricoPet('13/04/2022', 15),
                            HistoricoPet('13/05/2022', 30),
                            HistoricoPet('13/06/2022', 40),
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
