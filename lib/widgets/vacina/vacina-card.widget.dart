import 'package:flutter/material.dart';
import 'package:health_pets/pages/vacina.page.dart';

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
    return Container(
      height: 100,
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 15, top: 10),
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


    // return Container(
    //   height: 121,
    //   child: Column(
    //     children: <Widget>[
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         children: <Widget>[
    //             Container(
    //               width: MediaQuery.of(context).size.width * 0.3,
    //               height: 100,
    //               margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(right: 10),
    //               width: MediaQuery.of(context).size.width * 0.4,
    //               alignment: Alignment.centerLeft,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   Text(
    //                     nomeVacina,
    //                     style: TextStyle(
    //                         fontSize: 15, fontWeight: FontWeight.w500),
    //                   ),
    //                   SizedBox(
    //                     height: 5,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //         ],
    //       ),
    //       Divider(
    //         height: 1,
    //         thickness: 1,
    //         color: Colors.black12,
    //         indent: 15,
    //         endIndent: 15,
    //       ),
    //     ],
    //   ),
    // );
  }
}
