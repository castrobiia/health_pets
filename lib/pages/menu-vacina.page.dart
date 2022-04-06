import 'package:flutter/material.dart';
import 'package:health_pets/pages/editar-vacina.page.dart';
import 'package:health_pets/pages/vacinas.page.dart';

class MenuItemVacina {
  final String texto;
  final IconData icone;

  const MenuItemVacina({
    required this.texto,
    required this.icone,
  });
}

class MenuItensVacina {
  static const List<MenuItemVacina> items = [
    itemEditar,
    itemExcluir,
    itemCompartilhar,
  ];

  static const itemEditar = MenuItemVacina(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemVacina(
    texto: "Excluir",
    icone: Icons.delete,
  );

  static const itemCompartilhar = MenuItemVacina(
    texto: "Compartilhar",
    icone: Icons.share,
  );
}

PopupMenuItem<MenuItemVacina> buildItem(MenuItemVacina item) =>
    PopupMenuItem<MenuItemVacina>(
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

void onSelected(BuildContext context, MenuItemVacina item) {
  switch (item) {
    case MenuItensVacina.itemEditar:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditarVacina(),
        ),
      );
      break;
    case MenuItensVacina.itemExcluir:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VacinaPage(0), //arrumar depois
        ),
      );
      break;
    case MenuItensVacina.itemCompartilhar:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VacinaPage(0), //arrumar depois
        ),
      );
  }
}
