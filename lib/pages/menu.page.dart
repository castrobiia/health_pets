import 'package:flutter/material.dart';
import 'package:health_pets/pages/home.page.dart';
import 'package:health_pets/pages/login.page.dart';

class MenuItem {
  final String texto;
  final IconData icone;

  const MenuItem({
    required this.texto,
    required this.icone,
  });
}

class MenuItems {
  static const List<MenuItem> items = [
    itemVacinas,
    itemTratamentos,
    itemLogout,
  ];

  static const itemVacinas = MenuItem(
    texto: "Vacinas",
    icone: Icons.health_and_safety,
  );

  static const itemTratamentos = MenuItem(
    texto: "Tratamentos",
    icone: Icons.medication,
  );

  static const itemLogout = MenuItem(
    texto: "Sair",
    icone: Icons.logout_rounded,
  );
}

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
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

void onSelected(BuildContext context, MenuItem item) {
  switch (item) {
    case MenuItems.itemVacinas:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      break;
    case MenuItems.itemTratamentos:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      break;
    case MenuItems.itemLogout:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
  }
}
