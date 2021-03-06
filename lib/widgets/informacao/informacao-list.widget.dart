import 'package:flutter/material.dart';
import 'package:health_pets/repository/informacao-repository.dart';
import 'package:health_pets/repository/subcategoria-repository.dart';
import 'package:health_pets/widgets/informacao/informacao-card.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class InformacaoLista extends StatelessWidget {
  final int idAnimal;
  final String idSubcategoria;

  const InformacaoLista(this.idAnimal, this.idSubcategoria);

  @override
  Widget build(BuildContext context) {
    //InformacaoRepository().getSubcategoriaInfo(idAnimal, idSubcategoria);

    return Scaffold(
        body: FutureBuilder<dynamic>(
      future:
          InformacaoRepository().getSubcategoriaInfo(idAnimal, idSubcategoria),
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
        var listaSubcategoriaAnimal = snapshot.data;

        print('listaSubcategoriaAnimal: $listaSubcategoriaAnimal');
        

        if (listaSubcategoriaAnimal.length == 0) {
          return Center(
            child: Text(
              'Não há informações',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: listaSubcategoriaAnimal.length,
              itemBuilder: (context, index) {
                //for (var informacao in listaSubcategoriaAnimal) {
                var informacao = listaSubcategoriaAnimal[index];

                print('informacao: $informacao');

                return Container(
                  child: InformacaoCard(
                    idInformacao: informacao['id'] ?? 0,
                    idCategoria: informacao['id_categoria'] ?? 0,
                    idSubcategoria: informacao['id_subcategoria'] ?? 0,
                    idAnimal: informacao['id_animal'] ?? 0,
                    descricao: informacao['descricao'] ?? '',
                    data: informacao['data'] ?? '',
                    valor: informacao['valor'] ?? 0,
                    local: informacao['local'] ?? '',
                  ),
                );
              }
              // },
              );
        }
      },
    ));
  }
}
