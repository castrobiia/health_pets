import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/themes/color_theme.dart';

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
    return Slidable(
      key: ValueKey(nomeVacina),
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: 'Deletar',
            icon: Icons.delete,
            onPressed: (context) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Vacina deletada')));
            },
          ),
        ],
      ),
      // height: 100,
      // width: double.maxFinite,
      // margin: EdgeInsets.only(left: 15, top: 10),
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
                      dataAplicacao,
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
    );
  }
}
