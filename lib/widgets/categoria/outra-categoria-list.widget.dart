import 'package:flutter/material.dart';
import 'package:health_pets/repository/cadastro-geral-repository.dart';
import 'package:health_pets/widgets/categoria/outra-categoria-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class OutraCategoriaList extends StatelessWidget {
  int idAnimal;

  OutraCategoriaList(this.idAnimal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<dynamic>(
            future: CadastroGeralRepository().getInfosGeral(idAnimal),
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
                    var infosGeral = list[index];
                    return Container(
                      child: OutraCategoriaCard(
                        idinfosGeral: infosGeral['id'] ?? 0,
                        tituloinfosGeral: infosGeral['titulo'] ?? '',
                        datainfosGeral: infosGeral['data'] ?? '',
                        descricaoinfosGeral: infosGeral['descricao'] ?? '',
                        humor: infosGeral['humor'] ?? '',
                        peso: infosGeral['peso'] ?? '',
                        idAnimal: infosGeral['id_animal'] ?? 0,
                      ),
                    );
                  },
                );
              }
            }));
  }
}
