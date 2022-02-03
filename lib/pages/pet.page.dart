import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu.page.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pets"),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.items.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              child: petList(),
            ),
          ),
          Container(
            color: Colors.amber,
            height: 80,
            child: Text("Espaço botão"),
          ),
        ],
      ),
    );
  }
}

Widget petList() {
  return ListView(children: <Widget>[
    pet(),
    pet(),
    pet(),
    pet(),
  ]);
}

Widget pet() {
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
            "assets/dog.jpeg",
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 10,
          ),
          child: Column(
            children: <Widget>[
              Text("Nome"),
              Text("Espécie/raça"),
              Text("Idade"),
            ],),
        ),
      ],
    ),
  );
}
