import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/vacina-entity.dart';
import 'package:health_pets/models/vacina-model.dart';

import 'vacina-card.widget.dart';

class VacinaLista extends StatelessWidget {
  final int idAnimal;

  const VacinaLista(this.idAnimal);

  @override
  Widget build(BuildContext context) {
    //var id_animal;

    //List vacinas = [];

    VacinaEntity().getVacina(idAnimal);

    print('print da instância vacina: ${VacinaEntity().getVacina(idAnimal)}');
    print('idAnimal: $idAnimal');

    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: VacinaEntity().getVacina(idAnimal),
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
                child: Text('Erro ao carregar os dados'),
              ),
            );
          }

          final list = snapshot.data ?? [];

          if (list.length == 0) {
            return Center(
              child: Text(
                'Não há vacinas cadastradas',
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
                VacinaModel vacina = list[index];
                return Container(
                  child: VacinaCard(
                    idVacina: vacina.id ?? 0,
                    nomeVacina: vacina.nome ?? '',
                    dataAplicacao: vacina.data_aplicacao ?? '',
                    fabricante: vacina.fabricante ?? '',
                    lote: vacina.lote ?? '',
                    idAnimal: vacina.idAnimal ?? 0,
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
