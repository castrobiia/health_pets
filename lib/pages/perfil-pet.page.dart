import 'package:flutter/material.dart';

class PerfilPet extends StatelessWidget {
  const PerfilPet({Key? key}) : super(key: key);

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
              height: 550,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/perfil-cao1.jpeg"),
                      ),
                    ),
                  ),
                  Text(
                    "Thom",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Espécie",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Canina"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  /* SizedBox(
                    height: 10,
                  ), */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Raça",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Golden"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Sexo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Macho"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Idade",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("10 anos"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Data de Nascimento",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("01/01/2012"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Peso",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("10 kg"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Caramelo"),
                    ],
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Porte",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Grande"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
