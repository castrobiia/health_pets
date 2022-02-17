import 'package:flutter/material.dart';
import 'package:health_pets/widges/pet/pet-card.widget.dart';

class PetLista extends StatelessWidget {
  const PetLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 2,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 3,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 4,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
          PetCard(
            fotoPet: "assets/logo_health_pets.png",
            nomePet: "Dora",
            taxonomiaPet: "pug",
            idadePet: 5,
          ),
        ],
      ),
    );
  }
}
