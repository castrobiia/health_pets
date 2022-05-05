import 'package:flutter/material.dart';
import 'package:health_pets/pages/cadastro-diario.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/diario/diario-list.widget.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiarioPet extends StatefulWidget {
  const DiarioPet({Key? key}) : super(key: key);

  @override
  _DiarioPetState createState() => _DiarioPetState();
}

class _DiarioPetState extends State<DiarioPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: ColorTheme.salmao1,
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          setarMaterialPageRoute(context, CadastroDiario());
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Diário"),
        centerTitle: true,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: DiarioList(),
            ),
          ),
        ],
      ),
    );
  }
}
