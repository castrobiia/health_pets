import 'package:flutter/material.dart';
import 'package:health_pets/controllers/animal_controller.dart';
import 'package:health_pets/controllers/usuario_controller.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/pages/logout.page.dart';
// Todo descomentar para voltar ao estado principal. import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/pet.page.dart';
// Todo descomentar para voltar ao estado principal. import 'package:health_pets/repository/animal-repository.dart';

confirmarExclusaoAnimal(BuildContext context, id) {
  // Todo descomentar para voltar ao estado principal. var animalController = AnimalController(AnimalRepositoryy());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("Deseja excluir este animal?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                // Todo descomentar para voltar ao estado principal. animalController.deleteAnimal(id).then((value) {
                //   exibirMensagem(context, '$value');
                //   setarMaterialPageRoute(context, PetPage());
                // });
              },
              child: const Text('Sim'),
            ),
          ],
        );
      });
}

confirmarExclusaoUsuario(BuildContext context) {
  // Todo descomentar para voltar ao estado principal. var usuarioController = UsuarioController(UsuarioRepository());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text("Deseja excluir sua conta?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                // Todo descomentar para voltar ao estado principal. usuarioController.deleteUsuario().then((value) {
                //   exibirMensagem(context, '$value');
                //   deleteToken(context);
                //   setarMaterialPageRoute(context, LoginPage());
                // });
              },
              child: const Text('Sim'),
            ),
          ],
        );
      });
}
