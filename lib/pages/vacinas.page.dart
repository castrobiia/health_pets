import 'package:flutter/material.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/cadastro-vacina.page.dart';
import 'package:health_pets/pages/menu-vacina.page.dart';
import 'package:health_pets/widgets/vacina/tabela-vacina.widget.dart';

import '../themes/color_theme.dart';

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
          backgroundColor: ColorTheme.salmaoClaro,
          //cor do ícone
          foregroundColor: Colors.white,
          onPressed: () {
            setarMaterialPageRoute(context, CadastrarVacina(id));
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Vacinas"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 1,
          actions: [
            PopupMenuButton<MenuItemVacina>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItensVacina.items.map(buildItem).toList(),
              ],
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
                child: TabelaVacina(),
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
