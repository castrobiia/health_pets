import 'package:flutter/material.dart';
import 'package:health_pets/widgets/listagem-geral/listagem-list.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  Widget build(BuildContext context) {
    if (id != 0) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(AppLocalizations.of(context)!.vaccines),
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
    } else {
      return Text('oi'); //[TODO]
    }
  }
}
