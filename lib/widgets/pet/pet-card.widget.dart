import 'package:flutter/material.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';

class PetCard extends StatelessWidget {
  final int idPet;
  final String fotoPet;
  final String nomePet;

  PetCard({
    required this.idPet,
    required this.fotoPet,
    required this.nomePet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
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
                  fotoPet,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                width: 200,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      nomePet,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
                          // setarMaterialPageRoute(context, PerfilPetPage());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PerfilPetPage(idPet)));
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
