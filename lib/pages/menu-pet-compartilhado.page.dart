import 'package:flutter/material.dart';
import 'package:health_pets/pages/alert-dialog.dart';

class MenuItemPetCompartilhado {
  final String texto;
  final IconData icone;

  const MenuItemPetCompartilhado({
    required this.texto,
    required this.icone,
  });
}

class MenuItemsPetCompartilhado {
  static const List<MenuItemPetCompartilhado> items = [
    itemPetCompartilhado,
  ];

  static const itemPetCompartilhado = MenuItemPetCompartilhado(
    texto: "Adicionar Pet Compartilhado",
    icone: Icons.share,
  );
}

PopupMenuItem<MenuItemPetCompartilhado> buildItem(
        MenuItemPetCompartilhado item) =>
    PopupMenuItem<MenuItemPetCompartilhado>(
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

void onSelected(BuildContext context, MenuItemPetCompartilhado item) {
  if (item == MenuItemsPetCompartilhado.itemPetCompartilhado) {
    animalCompartilhado(context);
  }
}
