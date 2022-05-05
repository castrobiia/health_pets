import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MetaGasto extends StatefulWidget {
  @override
  _MetaGastoState createState() => _MetaGastoState();
}

class _MetaGastoState extends State<MetaGasto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 8.0),
                const Text(
                  "Estimativa dos gastos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24.0),
                _metaLinear(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Card _metaLinear(context) {
  return Card(
    child: LinearPercentIndicator(
      width: MediaQuery.of(context).size.width - 43,
      lineHeight: 30,
      percent: 0.75,
      center: Text(
        '(R\$) 200/300',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      progressColor: ColorTheme.rosa3,
      //backgroundColor: Colors.indigo,
      animation: true,
      animationDuration: 2500,
    ),
  );
}
