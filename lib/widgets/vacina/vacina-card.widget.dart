import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/editar-vacina.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';

class VacinaCard extends StatelessWidget {
  final int idVacina;
  final String nomeVacina;
  final String dataAplicacao;
  final String fabricante;
  final String lote;
  final int idAnimal;

  VacinaCard({
    required this.idVacina,
    required this.nomeVacina,
    required this.dataAplicacao,
    required this.fabricante,
    required this.lote,
    required this.idAnimal,
  });

  @override
  Widget build(BuildContext context) {
    var dataAplicacaoFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(dataAplicacao));
    return Slidable(
      //key: ValueKey(nomeVacina),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.cinza2,
            label: 'Editar',
            icon: Icons.edit,
            onPressed: (context) {
              setarMaterialPageRoute(context, EditarVacina());
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text("Vacina editada")));
            },
          ),
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: 'Deletar',
            icon: Icons.delete,
            onPressed: (context) {
              setarMaterialPageRoute(context, confirmarExclusaoVacina(context, idVacina));
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Vacina deletada")));
            },
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Vacina: $nomeVacina",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Fabricante: $fabricante',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Lote: $lote',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        dataAplicacaoFormatada,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black12,
              endIndent: 15,
            ),
          ],
        ),
      ),
    );
  }
}
