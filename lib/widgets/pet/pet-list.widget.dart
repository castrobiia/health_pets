import 'package:flutter/material.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/widgets/pet/pet-card.widget.dart';

class PetLista extends StatelessWidget {
  const PetLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List pets = [];

    RepositoryAnimal()
        .findAllAnimais()
        .then((animais) => animais.forEach((element) {
              // print('Id do print${element.id}');
            }));

    return Scaffold(
        body: FutureBuilder<List>(
      future: RepositoryAnimal().findAllAnimais(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          // return: show loading widget
          //todo mostrar o loading
        }
        if (snapshot.hasError) {
          // return: show error widget
        }
        final list = snapshot.data ?? [];
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              AnimalModel pet = list[index];
              return Container(
                child: PetCard(
                  idPet: pet.id ?? 0,
                  fotoPet: pet.foto ?? '',
                  nomePet: pet.nome ?? '',
                ),
              );
            });
      },
    ));
  }
}
