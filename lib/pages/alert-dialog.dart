import 'package:flutter/material.dart';
import 'package:health_pets/controllers/animal_controller.dart';
import 'package:health_pets/controllers/usuario_controller.dart';
import 'package:health_pets/controllers/vacina_controller.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/repository/vacina-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/animal-repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'vacina.page.dart';

confirmarExclusaoAnimal(BuildContext context, id) {
  var animalController = AnimalController(AnimalRepositoryy());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alert),
          content: Text(AppLocalizations.of(context)!.deleteAnimal),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () {
                animalController.deleteAnimal(id).then((value) {
                  exibirMensagem(context, '$value');
                  setarMaterialPageRoute(context, PetPage());
                });
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      });
}

confirmarExclusaoUsuario(BuildContext context) {
  var usuarioController = UsuarioController(UsuarioRepository());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alert),
          content: Text(AppLocalizations.of(context)!.deleteAccount),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () {
                usuarioController.deleteUsuario().then((value) {
                  exibirMensagem(context, '$value');
                  deleteToken(context);
                  setarMaterialPageRoute(context, LoginPage());
                });
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      });
}

confirmarExclusaoVacina(BuildContext context, id) {
  var vacinaController = VacinaController(VacinaRepository());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alert),
          content: Text(AppLocalizations.of(context)!.deleteVaccine),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () {
                vacinaController.deleteVacina(id).then((value) {
                  exibirMensagem(context, '$value');
                  setarMaterialPageRoute(context, VacinaPage(id));
                });
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      });
}

animalCompartilhado(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Animal Compartilhado"),
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Insira o código enviado por e-mail"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                exibirMensagem(context, 'Animal compartilhado com sucesso');
                setarMaterialPageRoute(context, TabsPage());
              },
              child: const Text(
                'Confirmar',
                style: TextStyle(color: ColorTheme.rosa1),
              ),
            ),
          ],
        );
      });
}

compartilharAnimal(BuildContext context, id) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Compartilhar Animal"),
        content: Container(
          height: 105,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Insira o e-mail com quem deseja compartilhar este animal"),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              exibirMensagem(context,
                  'Enviado e-mail ao usuário com o código para compartilhamento');
              setarMaterialPageRoute(context, PerfilPetPage(id));
            },
            child: const Text(
              'Confirmar',
              style: TextStyle(color: ColorTheme.rosa1),
            ),
          ),
        ],
      );
    },
  );
}
