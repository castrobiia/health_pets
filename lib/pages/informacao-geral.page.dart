import 'package:flutter/material.dart';
import 'package:health_pets/widgets/informacao/informacao-list.widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InformacaoPage extends StatefulWidget {
  const InformacaoPage(this.id);
  final int id;

  @override
  State<InformacaoPage> createState() => _InformacaoPageState(this.id);
}

class _InformacaoPageState extends State<InformacaoPage> {
  final int id;
  _InformacaoPageState(this.id);

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
                child: InformacaoLista(id),
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
