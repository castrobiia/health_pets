import 'package:flutter/material.dart';
import 'package:health_pets/repository/cadastro-geral-repository.dart';
import 'package:health_pets/widgets/listagem-geral/listagem-list.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:health_pets/widgets/widgets.dart';

class ListagemPage extends StatefulWidget {
  const ListagemPage(this.id);
  final int id;

  @override
  State<ListagemPage> createState() => _ListagemPageState(this.id);
}

class _ListagemPageState extends State<ListagemPage> {
  final int id;
  _ListagemPageState(this.id);

  @override
  var conexaoInfoSaude;
  initState() {
    setState(() {
      conexaoInfoSaude = CadastroGeralRepository().getInfosGeral(id);
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
              return Center(
                child: Container(
                  child: erroCarregarDados(context),
                ),
              );
            }

            final listaInfosGeral = snapshot.data ?? [];
            int tamanhoLista = listaInfosGeral.length;

            for (var i = 0; i < tamanhoLista; i++) {
              if (listaInfosGeral[i]['id_subcategoria'] == 85) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: Text(AppLocalizations.of(context)!.exams),
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
                          child: ListagemLista(id),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (listaInfosGeral[i]['id_subcategoria'] == 86) {
                return Text('outros'); //[TODO]
              }
            }
          }),
    );
  }
}
