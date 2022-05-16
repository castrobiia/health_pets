import 'package:flutter/material.dart';
import 'package:health_pets/pages/gasto.page.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuItemGasto {
  final String texto;
  final IconData icone;

  const MenuItemGasto({
    required this.texto,
    required this.icone,
  });
}

class MenuItemsGasto {
  static const List<MenuItemGasto> items = [
    itemEditar,
    itemExcluir,
  ];

  static const itemEditar = MenuItemGasto(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemGasto(
    texto: "Excluir",
    icone: Icons.delete,
  );
}

PopupMenuItem<MenuItemGasto> buildItem(MenuItemGasto item) => PopupMenuItem(
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

void onSelected(BuildContext context, MenuItemGasto item) {
  switch (item) {
    case MenuItemsGasto.itemEditar:
      setarMaterialPageRoute(context, GastoPage());
      break;
    case MenuItemsGasto.itemExcluir:
      setarMaterialPageRoute(context, GastoPage());
  }
}
