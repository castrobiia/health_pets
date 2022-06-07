import 'package:flutter/material.dart';
import 'package:health_pets/widgets/vacina/vacina-list.widget.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/desuso/cadastro-vacina.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../themes/color_theme.dart';

class VacinaPage extends StatefulWidget {
  const VacinaPage(this.id);
  final int id;

  @override
  State<VacinaPage> createState() => _VacinaPageState(this.id);
}

class _VacinaPageState extends State<VacinaPage> {
  final int id;
  _VacinaPageState(this.id);

  @override
  Widget build(BuildContext context) {
    if (id != 0) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: ColorTheme.salmao1,
          //cor do ícone
          foregroundColor: Colors.white,
          onPressed: () {
            setarMaterialPageRoute(context, CadastrarVacina(id));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.vaccines),
          centerTitle: true,
          elevation: 1,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                color: Colors.white,
                child: VacinaLista(id),
              ),
            ),
          ],
        ),
      );
    } else {
      return Text('oi'); //[TODO]
    }
  }
}
