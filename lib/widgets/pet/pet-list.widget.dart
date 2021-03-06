import 'package:flutter/material.dart';
import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/widgets/pet/pet-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PetLista extends StatelessWidget {
  const PetLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pets = [];

    AnimalRepository()
        .findAllAnimais()
        .then((animais) => animais.forEach((element) {
              // print('Id do print${element.id}');
            }));

    return Scaffold(
      body: FutureBuilder<List>(
        future: AnimalRepository().findAllAnimais(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Container(
                child: erroCarregarDados(context),
              ),
            );
          }

          final list = snapshot.data ?? [];

          if (list.length == 0) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.animalsRegistered,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                AnimalModel pet = list[index];
                return Container(
                  color: Colors.white,
                  child: PetCard(
                    idPet: pet.id ?? 0,
                    fotoPet: pet.foto ?? '',
                    nomePet: pet.nome ?? '',
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
