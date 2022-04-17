import 'package:flutter/material.dart';

import '../themes/color_theme.dart';
import '../widgets/gasto/gasto-grafico-donut.widget.dart';

class ChamaGasto extends StatefulWidget {
  @override
  _ChamaGastoState createState() => _ChamaGastoState();
}

final List<Dados> dataset = [
  Dados(0.5, "Alimentação", ColorTheme.rosa1),
  Dados(0.1, "Higiene", ColorTheme.primaryColor),
  Dados(0.1, "Despesas médicas", ColorTheme.roxo2),
  Dados(0.1, "Lazer e diversão", ColorTheme.vermelho1),
  Dados(0.1, "Acessórios", ColorTheme.roxo1),
  Dados(0.1, "Outros", ColorTheme.branco1),
];

class _ChamaGastoState extends State<ChamaGasto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GraficoDonutWidget(dataset),
    );
  }
}
