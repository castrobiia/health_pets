import 'package:flutter/material.dart';
import 'package:health_pets/repository/cadastro-geral-repository.dart';
import 'package:health_pets/widgets/informacao/informacao-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class InformacaoLista extends StatelessWidget {
  final int idAnimal;

  const InformacaoLista(this.idAnimal);

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
                var informacao = list[index];
                return Container(
                  child: InformacaoCard(
                    id: informacao['id'] ?? 0,
                    idCategoria: informacao['id_categoria'] ?? 0,
                    idSubcategoria: informacao['id_subcategoria'] ?? 0,
                    idAnimal: informacao['id_animal'] ?? 0,
                    descricao: informacao['descricao'] ?? '',
                    data: informacao['data'] ?? '',
                    valor: informacao['valor'] ?? 0,
                    local: informacao['local'] ?? '',
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
