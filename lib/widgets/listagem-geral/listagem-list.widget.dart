import 'package:flutter/material.dart';
import 'package:health_pets/repository/cadastro-geral-repository.dart';
import 'package:health_pets/widgets/listagem-geral/listagem-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class ListagemLista extends StatelessWidget {
  final int idAnimal;

  const ListagemLista(this.idAnimal);

  @override
  Widget build(BuildContext context) {
    CadastroGeralRepository().getInfosGeral(idAnimal);

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
                'Não há cadastro',
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
                var listagem = list[index];
                return Container(
                  child: ListagemCard(
                    id: listagem['id'] ?? 0,
                    idCategoria: listagem['id_categoria'] ?? 0,
                    idSubcategoria: listagem['id_subcategoria'] ?? 0,
                    idAnimal: listagem['id_animal'] ?? 0,
                    descricao: listagem['descricao'] ?? '',
                    data: listagem['data'] ?? '',
                    valor: listagem['valor'] ?? 0.0,
                    local: listagem['local'] ?? '',
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
