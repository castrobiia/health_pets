import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:health_pets/repository/informacao-repository.dart';
import 'package:health_pets/widgets/informacao/informacao-list.widget.dart';
import 'package:health_pets/widgets/widgets.dart';

class InformacaoPage extends StatefulWidget {
  const InformacaoPage(this.idAnimal, this.idSubcategoria);
  final int idAnimal, idSubcategoria;

  @override
  State<InformacaoPage> createState() =>
      _InformacaoPageState(this.idAnimal, this.idSubcategoria);
}

class _InformacaoPageState extends State<InformacaoPage> {
  final int idAnimal;
  final int idSubcategoria;
  _InformacaoPageState(this.idAnimal, this.idSubcategoria);

  @override
  var conexaoInfoSaude;
  initState() {
    setState(() {
      conexaoInfoSaude =
          InformacaoRepository().getSubcategoriaInfo(idAnimal, idSubcategoria);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
          future: conexaoInfoSaude,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Container(
                  child: erroCarregarDados(context),
                ),
              );
            }

            var listaInfosGeral = snapshot.data;
            int tamanhoLista = listaInfosGeral.length;

            String titulo = 'Informação';

            for (var i = 0; i < tamanhoLista; i++) {
              if (listaInfosGeral[i]['id_subcategoria'] == 17) {
                titulo = AppLocalizations.of(context)!.consultations;
                idSubcategoria == 84;
              }
              if (listaInfosGeral[i]['id_subcategoria'] == 18) {
                titulo = AppLocalizations.of(context)!.exams;
                idSubcategoria == 85;
              }
              if (listaInfosGeral[i]['id_subcategoria'] == 19) {
                titulo = AppLocalizations.of(context)!.medicines;
                idSubcategoria == 86;
              }
              if (listaInfosGeral[i]['id_subcategoria'] == 20) {
                titulo = AppLocalizations.of(context)!.procedures;
                idSubcategoria == 87;
              }
              if (listaInfosGeral[i]['id_subcategoria'] == 21) {
                titulo = AppLocalizations.of(context)!.vaccine;
                idSubcategoria == 88;
              }
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(titulo),
                centerTitle: true,
                elevation: 1,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1,
                      color: Colors.white,
                      child:
                          InformacaoLista(idAnimal, idSubcategoria.toString()),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
