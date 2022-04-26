import 'package:flutter/material.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';

class VacinaCard extends StatelessWidget {
  final int idVacina;
  final String nomeVacina;
  final String dataAplicacao;
  final String fabricante;
  final String lote;

  VacinaCard({
    required this.idVacina,
    required this.nomeVacina,
    required this.dataAplicacao,
    required this.fabricante,
    required this.lote,
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(idVacina)));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(idVacina)));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 200,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        dataAplicacao,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PerfilPetPage(idVacina)));
                        },
                        icon: Icon(Icons.navigate_next))
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
