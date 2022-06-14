import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InformacaoCard extends StatelessWidget {
  final int idInformacao;
  final String data;
  final String descricao;
  final int idCategoria;
  final int idSubcategoria;
  final String local;
  final int valor;
  final int idAnimal;

  InformacaoCard({
    required this.idAnimal,
    required this.idInformacao,
    required this.data,
    required this.descricao,
    required this.idCategoria,
    required this.idSubcategoria,
    required this.local,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    var dataFormatada = DateFormat("dd/MM/yyyy").format(DateTime.parse(data));
    return Slidable(
      //key: ValueKey(nomeVacina),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.cinza2,
            label: AppLocalizations.of(context)!.edit,
            icon: Icons.edit,
            onPressed: (context) {
              //setarMaterialPageRoute(context, EditarVacina());
              // ScaffoldMessenger.of(context)
              //     .showSnackBar(SnackBar(content: Text("Vacina editada")));
            },
          ),
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: AppLocalizations.of(context)!.delete,
            icon: Icons.delete,
            onPressed: (context) {
              setarMaterialPageRoute(
                  context, confirmarExclusaoInformacao(context, idInformacao, idAnimal));
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Deletado com sucesso")));
            },
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Descrição: $descricao",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Valor: $valor',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Local: $local',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        dataFormatada,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black12,
              endIndent: 15,
            ),
          ],
        ),
      ),
    );
  }
}
