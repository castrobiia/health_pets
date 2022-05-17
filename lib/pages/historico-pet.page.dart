import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/vacina.page.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      iconesHistorico(
                        context,
                        VacinaPage(id),
                        Image.asset("assets/injection.png"),
                        AppLocalizations.of(context)!.vaccines,
                        "5",
                      ),
                      iconesHistorico(context, DiarioPet(), Image.asset("assets/diario.png"), AppLocalizations.of(context)!.diary, "1"),
                      
                    ],
                  ),
                  SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    title:
                        ChartTitle(text: AppLocalizations.of(context)!.weight),
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
