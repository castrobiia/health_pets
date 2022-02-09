import 'package:flutter/material.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';

class PetCard extends StatelessWidget {
  final String image;
  final String petName;
  final String taxonomy;
  final int age;

  PetCard({
    required this.image,
    required this.petName,
    required this.taxonomy,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      //margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 15, left: 10),
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                width: 200,
                //color: Colors.black12,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      petName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(taxonomy),
                    //Text("${age} anos"), // fazer um if/switch pra: ano, mes, meses
                  ],
                ),
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PerfilPetPage(), //depois alterar para o perfil do pet
                            ),
                          );
                        },
                        icon: Icon(Icons.navigate_next))

                    //Icon(Icons.edit),
                    //Icon(Icons.delete),
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
          )
        ],
      ),
    );
  }
}
