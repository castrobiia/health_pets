import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/animal-entity.dart';
import 'package:health_pets/class/entity/especie-entity.dart';
import 'package:health_pets/class/entity/raca-entity.dart';
import 'package:health_pets/class/util.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:intl/intl.dart';

class PerfilPet extends StatefulWidget {
  final id;
  const PerfilPet(this.id);

  @override
  State<PerfilPet> createState() => _PerfilPetState(this.id);
}

class _PerfilPetState extends State<PerfilPet> {
  final int id;
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
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              width: double.infinity,
              height: 500,
              decoration: boxDecoration(Colors.white),
              child: FutureBuilder<dynamic>(
                  future: AnimalEntity().getAnimal(id),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      // return: show loading widget
                      //todo mostrar o loading
                      return Center(
                          child: Container(child: CircularProgressIndicator()));
                    }
                    if (snapshot.hasError) {
                      // return: show error widget
                      return Center(
                        child: Container(
                          child: Text('Erro ao carregar os dados'),
                        ),
                      );
                    }

                    final animal = snapshot.data;

                    var dataFormatada = DateFormat("dd/MM/yyyy")
                        .format(DateTime.parse(animal['data_nascimento']))
                        .toString();

                    List<String> camposData = dataFormatada.split('/');

                    int dia = int.parse(camposData[0]);
                    int mes = int.parse(camposData[1]);
                    int ano = int.parse(camposData[2]);

                    DateTime nascimento = DateTime(ano, mes, dia);
                    DateTime hoje = DateTime.now();

                    var idade = Util().calculoIdade(hoje, nascimento);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(animal['foto'] ?? ''),
                            ),
                          ),
                        ),
                        Text(
                          animal['nome'],
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<dynamic>(
                          future:
                              EspecieEntity().getEspecie(animal['id_especie']),
                          builder: (context, snapshot) {
                            final especie = snapshot.data;
                            return setarRowPerfil(
                                "Espécie", especie['descricao'] ?? '');
                          },
                        ),
                        divider(),
                        FutureBuilder<dynamic>(
                          future: RacaEntity().getRaca(animal['id_raca']),
                          builder: (context, snapshot) {
                            final raca = snapshot.data;

                            return setarRowPerfil("Raça", raca['nome'] ?? '');
                          },
                        ),
                        divider(),
                        setarRowPerfil("Idade", idade),
                        divider(),
                        setarRowPerfil("Data de Nascimento", dataFormatada),
                        divider(),
                        // add campo peso somente quando habilitar cadastro de peso
                        /*
                        setarRowPerfil("Peso", "10 kg"),
                        divider(),
                         */
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
