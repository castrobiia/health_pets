import 'package:flutter/material.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/animal-model.dart';

class PerfilPet extends StatelessWidget {
  final id;
  const PerfilPet( this.id);

  @override
  Widget build(BuildContext context) {
    final List animal = [];
    // RepositoryAnimal().getAnimal(id).then((value) => animal.add(value));
    RepositoryAnimal().getAnimal(id).then((value) => print(value));
    // print(RepositoryAnimal().getAnimal(id));
    print("retorno animal perfil");
    // print(animal?[0]);
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
              height: 650,
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
                        // image: AssetImage(animal?[0].foto ?? ''),
                        image: AssetImage( 'jhsgjadhsgjas'),
                      ),
                    ),
                  ),
                  Text(
                    '',
                    // animal?[0].nome ?? '',
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
                      // Text(animal?[0].dataNascimento ?? ''),
                      Text(''),
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
