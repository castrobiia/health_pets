import 'package:flutter/material.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/widgets/widgets.dart';

class MenuItemUsuario {
  final String texto;
  final IconData icone;

  const MenuItemUsuario({required this.texto, required this.icone});
}

class MenuItemsUsuario {
  static const List<MenuItemUsuario> items = [
    itemEditar,
    itemExcluir,
    itemLogout,
  ];

  static const itemEditar = MenuItemUsuario(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemUsuario(
    texto: "Excluir",
    icone: Icons.delete,
  );

  static const itemLogout = MenuItemUsuario(
    texto: "Sair",
    icone: Icons.logout_rounded,
  );
}

PopupMenuItem<MenuItemUsuario> buildItem(MenuItemUsuario item) =>
    PopupMenuItem<MenuItemUsuario>(
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

void onSelected(BuildContext context, MenuItemUsuario item) {
  switch (item) {
    case MenuItemsUsuario.itemEditar:
      setarMaterialPageRoute(context, PetPage());
      break;
    case MenuItemsUsuario.itemExcluir:
      setarMaterialPageRoute(context, PetPage());
      break;
    case MenuItemsUsuario.itemLogout:
      setarMaterialPageRoute(context, LogoutPage());
  }
}
