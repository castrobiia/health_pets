import 'package:flutter/material.dart';
import 'package:health_pets/pages/informacao-diario.page.dart';

class DiarioCard extends StatelessWidget {
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
                          'Título do diário',
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
                          '12/03/2022',
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
                          'Descrição do diário',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InformacaoDiario()));
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
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
