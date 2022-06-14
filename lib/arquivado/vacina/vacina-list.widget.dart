import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/vacina-entity.dart';
import 'package:health_pets/widgets/widgets.dart';

import 'vacina-card.widget.dart';

class VacinaLista extends StatelessWidget {
  final int idAnimal;

  const VacinaLista(this.idAnimal);

  @override
  Widget build(BuildContext context) {
    VacinaEntity().getVacina(idAnimal);

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
                child: erroCarregarDados(context),
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
                var vacina = list[index];
                return Container(
                  child: VacinaCard(
                    idVacina: vacina['id'] ?? 0,
                    nomeVacina: vacina['nome'] ?? '',
                    dataAplicacao: vacina['data_aplicacao'] ?? '',
                    fabricante: vacina['fabricante'] ?? '',
                    lote: vacina['lote'] ?? '',
                    idAnimal: vacina['idAnimal'] ?? 0,
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
