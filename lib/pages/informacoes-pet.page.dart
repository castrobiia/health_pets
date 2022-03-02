import 'package:flutter/material.dart';
import 'package:health_pets/widgets/vacina/tabela-vacina.widget.dart';

class InformacoesPet extends StatefulWidget {
  const InformacoesPet({Key? key}) : super(key: key);

  @override
  _InformacoesPetState createState() => _InformacoesPetState();
}

class _InformacoesPetState extends State<InformacoesPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                boxShadow: [
                  new BoxShadow(
                    //cor do fundo (em volta) do container
                    color: Colors.black12,
                    //qnt de sombra
                    offset: new Offset(1, 2.0),
                    //expansao da sombra
                    blurRadius: 5,
                    //intensidade da borda
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
