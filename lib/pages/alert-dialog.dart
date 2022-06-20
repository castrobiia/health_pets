import 'package:flutter/material.dart';
import 'package:health_pets/controllers/animal_controller.dart';
import 'package:health_pets/controllers/diario_controller.dart';
import 'package:health_pets/controllers/informacao_controller.dart';
import 'package:health_pets/controllers/usuario_controller.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/pages/informacao-geral.page.dart';
import 'package:health_pets/pages/login.page.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/diario-repository.dart';
import 'package:health_pets/repository/informacao-repository.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/repository/animal-repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

confirmarExclusaoInformacao(BuildContext context, idInformacao, idAnimal,
    {idSubcategoria}) {
  var informacaoController = InformacaoController(InformacaoRepository());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alert),
          content: Text(AppLocalizations.of(context)!.deleteItem),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () {
                informacaoController.deleteInfo(idInformacao).then((value) {
                  exibirMensagem(context, '$value');
                  setarMaterialPageRoute(
                      context, InformacaoPage(idAnimal, idSubcategoria));
                });
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      });
}

confirmarExclusaoDiario(BuildContext context, idDiario, idAnimal) {
  var diarioController = DiarioController(DiarioRepository());
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.alert),
          content: Text(AppLocalizations.of(context)!.deleteDiary),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(AppLocalizations.of(context)!.no),
            ),
            TextButton(
              onPressed: () {
                diarioController.deleteDiario(idDiario).then((value) {
                  exibirMensagem(context, '$value');
                  setarMaterialPageRoute(context, DiarioPet(idAnimal));
                });
              },
              child: Text(AppLocalizations.of(context)!.yes),
            ),
          ],
        );
      });
}
