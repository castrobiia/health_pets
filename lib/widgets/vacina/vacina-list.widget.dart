import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/vacina-entity.dart';
import 'package:health_pets/models/vacina-model.dart';

import 'vacina-card.widget.dart';

class VacinaLista extends StatelessWidget {
  const VacinaLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var id_animal;

    var snapshoot;
    final vacina = snapshoot.data;

    //List vacinas = [];

    VacinaEntity().getVacina(vacina['id_animal']);

    print('print da vacina: ${VacinaEntity().getVacina(vacina['id_animal'])}');
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: VacinaEntity().getVacina(vacina['id_animal']),
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
                    idVacina: vacina.idVacina ?? 0,
                    nomeVacina: vacina.nomeVacina ?? '',
                    dataAplicacao: vacina.dataAplicacao ?? '',
                    fabricante: vacina.fabricante ?? '',
                    lote: vacina.lote ?? '',
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
