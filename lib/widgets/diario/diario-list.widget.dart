import 'package:flutter/material.dart';
import 'package:health_pets/repository/diario-repository.dart';
import 'package:health_pets/widgets/diario/diario-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class DiarioList extends StatelessWidget {
  int idAnimal;

  DiarioList(this.idAnimal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<dynamic>(
            future: DiarioRepository().getDiarios(idAnimal),
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
                    'Não há diários cadastrados',
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
                    var diario = list[index];
                    return Container(
                      child: DiarioCard(
                        idDiario: diario['id'] ?? 0,
                        tituloDiario: diario['titulo'] ?? '',
                        dataDiario: diario['data'] ?? '',
                        descricaoDiario: diario['descricao'] ?? '',
                        humor: diario['humor'] ?? '',
                        peso: diario['peso'] ?? '',
                        idAnimal: diario['id_animal'] ?? 0,
                      ),
                    );
                  },
                );
              }
            }));
  }
}
