import 'package:flutter/material.dart';
import 'package:health_pets/pages/pet.page.dart';

class MenuItemPet {
  final String texto;
  final IconData icone;

  const MenuItemPet({
    required this.texto,
    required this.icone,
  });
}

class MenuItemsPet {
  static const List<MenuItemPet> items = [
    itemEditar,
    itemExcluir,
  ];

  static const itemEditar = MenuItemPet(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemPet(
    texto: "Excluir",
    icone: Icons.delete,
  );
}

PopupMenuItem<MenuItemPet> buildItem(MenuItemPet item) =>
    PopupMenuItem<MenuItemPet>(
      value: item,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(item.icone),
          SizedBox(width: 15),
          Text(item.texto),
        ],
      ),
    );

void onSelected(BuildContext context, MenuItemPet item) {
  switch (item) {
    case MenuItemsPet.itemEditar:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetPage(), //arrumar depois
        ),
      );
      break;
    case MenuItemsPet.itemExcluir:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PetPage(), //arrumar depois
        ),
      );
  }
}
