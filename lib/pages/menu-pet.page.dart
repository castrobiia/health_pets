import 'package:flutter/material.dart';
import 'package:health_pets/controllers/animal_controller.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/editar-pet.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/animal-repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    itemCompartilhar,
  ];

  static const itemEditar = MenuItemPet(
    texto: "Editar",
    icone: Icons.edit,
  );

  static const itemExcluir = MenuItemPet(
    texto: "Excluir",
    icone: Icons.delete,
  );

  static const itemCompartilhar = MenuItemPet(
    texto: "Compartilhar",
    icone: Icons.share,
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

void onSelected(BuildContext context, MenuItemPet item, dynamic id) {
  final idPet = id;
  var animalController = AnimalController(AnimalRepositoryy());
  switch (item) {
    case MenuItemsPet.itemEditar:
      setarMaterialPageRoute(context, EditarPetPage(idPet));
      break;
    case MenuItemsPet.itemExcluir:
      confirmarExclusaoAnimal(context, id);
      break;
    case MenuItemsPet.itemCompartilhar:
      compartilharAnimal(context, id);
  }
}
