import 'package:flutter/material.dart';

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
      height: 120,
      margin: EdgeInsets.all(5),
    child: Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(10),
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(petName),
              Text(taxonomy),
              Text("${age} anos"), // fazer um if/switch pra: ano, mes, meses
            ],),
        ),
      ],
    ),
  );
  }
}
