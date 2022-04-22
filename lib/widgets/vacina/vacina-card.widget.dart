import 'package:flutter/material.dart';

class VacinaCard extends StatelessWidget {
  final int idVacina;
  final String nomeVacina;
  final String dataAplicacao;
  final String lote;
  final String fabricante;

  VacinaCard({
    required this.idVacina,
    required this.nomeVacina,
    required this.dataAplicacao,
    required this.lote,
    required this.fabricante,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 121,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

             Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 200,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        nomeVacina,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
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
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
