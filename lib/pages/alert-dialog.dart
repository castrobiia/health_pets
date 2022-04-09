import 'package:flutter/material.dart';

createInfoDialogPet(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("Deseja excluir este animal?"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                icon: Icon(Icons.close))
          ],
        );
      });
}
