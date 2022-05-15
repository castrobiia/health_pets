import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/animal-entity.dart';
import 'package:health_pets/class/entity/especie-entity.dart';
import 'package:health_pets/class/entity/raca-entity.dart';
import 'package:health_pets/class/util.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PerfilPet extends StatefulWidget {
  final id;
  const PerfilPet(this.id);

  @override
  State<PerfilPet> createState() => _PerfilPetState(this.id);
}

class _PerfilPetState extends State<PerfilPet> {
  final int id;
  XFile? image;
  _PerfilPetState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              padding: EdgeInsets.only(left: 40, right: 40),
              width: double.infinity,
              height: 500,
              decoration: boxDecoration(Colors.white),
              child: FutureBuilder<dynamic>(
                future: AnimalEntity().getAnimal(id),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Container(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        child: erroCarregarDados(context),
                      ),
                    );
                  }

                  final animal = snapshot.data;

                  var dataFormatada =
                      Util().formatarData(animal['data_nascimento']);

                  var idade = Util().calculoIdade(dataFormatada);
                  image = XFile(animal['foto']);

                  return FutureBuilder<dynamic>(
                    future: EspecieEntity().getEspecie(animal['id_especie']),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                            child:
                                Container(child: CircularProgressIndicator()));
                      }
                      final especie = snapshot.data;
                      return FutureBuilder<dynamic>(
                        future: RacaEntity().getRaca(animal['id_raca']),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                                child: Container(
                                    child: CircularProgressIndicator()));
                          }
                          final raca = snapshot.data;
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 200,
                                margin: EdgeInsets.only(top: 15, left: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                              "https://healthpets.app.br/storage/pets/${animal['foto']}")
                                          .image
                                      // FileImage(File(image!.path)) as ImageProvider,
                                      ),
                                ),
                              ),
                              Text(
                                animal['nome'],
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              setarRowPerfil(
                                  AppLocalizations.of(context)!.species,
                                  especie['nome'] ?? ''),
                              divider(),
                              setarRowPerfil(
                                  AppLocalizations.of(context)!.breed,
                                  raca['nome'] ?? ''),
                              divider(),
                              setarRowPerfil(
                                  AppLocalizations.of(context)!.age, idade),
                              divider(),
                              setarRowPerfil(
                                  AppLocalizations.of(context)!.birthDate,
                                  dataFormatada),
                              divider(),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
