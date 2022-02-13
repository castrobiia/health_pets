import 'package:flutter/material.dart';
import 'package:health_pets/pages/cadastro-pet.page.dart';
import 'package:health_pets/pages/menu.page.dart';
import 'package:health_pets/widges/pet/pet-list.widget.dart';

class PetPage extends StatelessWidget {
  const PetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFF6BD87),
        //cor do ícone
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DefaultTabController(
                      child: CadastrarPetPage(),
                      length: 4,
                    )),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Pets"),
        elevation: 1,
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
              color: Colors.white,
              child: PetList(),
            ),
          ),
          /* Container(
            color: Colors.amber,
            height: 80,
            child: Text("Espaço botão"),
          ), */
        ],
      ),
    );
  }
}
