import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu.page.dart';
import 'package:health_pets/widges/pet/pet-list.widget.dart';


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
              child: PetList(),
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
