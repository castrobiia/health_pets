import 'package:flutter/material.dart';
import 'package:health_pets/pages/informacao-diario.page.dart';
import 'package:intl/intl.dart';

class DiarioCard extends StatelessWidget {
  int idDiario;
  String tituloDiario;
  String dataDiario;
  String descricaoDiario;
  int peso;
  String humor;
  int idAnimal;

  DiarioCard({
    required this.idDiario,
    required this.tituloDiario,
    required this.dataDiario,
    required this.descricaoDiario,
    required this.peso,
    required this.humor,
    required this.idAnimal,
  });

  @override
  Widget build(BuildContext context) {
    var dataDiarioFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(dataDiario));

    if (tituloDiario.length > 30) {
      tituloDiario = tituloDiario.substring(0, 30) + '...';
    }

    if (humor.length > 30) {
      humor = humor.substring(0, 30) + '...';
    }

    return Container(
      //height: 150,
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.only(left: 15, top: 10, right: 5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 35,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          tituloDiario,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          humor,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   width: 300,
                  //   height: 30,
                  //   alignment: Alignment.centerLeft,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       Text(
                  //         descricaoDiario,
                  //         style: TextStyle(fontSize: 15),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          dataDiarioFormatada,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 30,
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          peso.toString() + ' kg',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Container(
              //   width: 80,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       IconButton(
              //           onPressed: () {
              //             Navigator.of(context).push(MaterialPageRoute(
              //                 builder: (context) => InformacaoDiario()));
              //           },
              //           icon: Icon(Icons.navigate_next))
              //     ],
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                //height: 75,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      descricaoDiario,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 7),
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
