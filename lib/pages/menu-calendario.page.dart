import 'package:flutter/material.dart';
import 'package:health_pets/pages/cadastro-lembrete.page.dart';
import 'package:health_pets/widgets/widgets.dart';

class MenuItemCalendario {
  final String texto;
  final IconData icone;

  const MenuItemCalendario({required this.texto, required this.icone});
}

class MenuItemsCalendario {
  static const List<MenuItemCalendario> items = [
    itemDiario,
    itemLembrete,
  ];

  static const itemDiario = MenuItemCalendario(
    texto: "Criar Diário",
    icone: Icons.event,
  );

  static const itemLembrete = MenuItemCalendario(
    texto: "Criar Lembrete",
    icone: Icons.event_note,
  );
}

PopupMenuItem<MenuItemCalendario> buildItem(MenuItemCalendario item) =>
    PopupMenuItem<MenuItemCalendario>(
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

void onSelected(BuildContext context, MenuItemCalendario item) {
  switch (item) {
    case MenuItemsCalendario.itemDiario:
      break;
    case MenuItemsCalendario.itemLembrete:
      setarMaterialPageRoute(context, CadastroLembrete());
  }
}
