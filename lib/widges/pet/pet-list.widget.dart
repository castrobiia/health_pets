import 'package:flutter/material.dart';
import 'package:health_pets/widges/pet/pet-card.widget.dart';

class PetList extends StatelessWidget {
  const PetList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
        PetCard(
          image: "assets/logo_health_pets.png",
          petName: "Dora",
          taxonomy: "pug",
          age: 2,
        ),
        PetCard(
          image: "assets/logo_health_pets.png",
          petName: "Dora",
          taxonomy: "pug",
          age: 3,
        ),
        PetCard(
          image: "assets/logo_health_pets.png",
          petName: "Dora",
          taxonomy: "pug",
          age: 4,
        ),
        PetCard(
          image: "assets/logo_health_pets.png",
          petName: "Dora",
          taxonomy: "pug",
          age: 5,
        ),
      ]),
  );
  }
}
