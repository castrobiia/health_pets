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
      height: 100,
      //margin: EdgeInsets.all(5),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(left: 10),
            child: Image.asset(
              image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  petName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(taxonomy),
                //Text("${age} anos"), // fazer um if/switch pra: ano, mes, meses
              ],
            ),
          ),
          SizedBox(
            width: 110,
          ),
          Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.navigate_next)
                //Icon(Icons.edit),
                //Icon(Icons.delete),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
