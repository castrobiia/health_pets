import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/widgets/widgets.dart';

class MenuItemDiario {
  final String texto;
  final IconData icone;

  const MenuItemDiario({
    required this.texto,
    required this.icone,
  });
}

class MenuItemsDiario {
  static const List<MenuItemDiario> items = [
    itemEditar,
    itemExcluir,
  ];

  static const itemEditar = MenuItemDiario(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemDiario(
    texto: "Excluir",
    icone: Icons.delete,
  );
}

PopupMenuItem<MenuItemDiario> buildItem(MenuItemDiario item) => PopupMenuItem(
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

void onSelected(BuildContext context, MenuItemDiario item) {
  switch (item) {
    case MenuItemsDiario.itemEditar:
      setarMaterialPageRoute(context, DiarioPet());
      break;
    case MenuItemsDiario.itemExcluir:
      setarMaterialPageRoute(context, DiarioPet());
  }
}
