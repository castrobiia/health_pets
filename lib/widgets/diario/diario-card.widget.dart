import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/editar-diario.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DiarioCard extends StatelessWidget {
  int idDiario;
  String tituloDiario;
  String dataDiario;
  String descricaoDiario;
  double peso;
  String humor;
  int idAnimal;

  DiarioCard({
    required this.idDiario,
    required this.tituloDiario,
    required this.dataDiario,
    required this.descricaoDiario,
    required this.peso,
    required this.humor,
    required this.idAnimal,
  });

  @override
  Widget build(BuildContext context) {
    var dataDiarioFormatada =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(dataDiario));

    if (tituloDiario.length > 30) {
      tituloDiario = tituloDiario.substring(0, 30) + '...';
    }

    if (humor.length > 30) {
      humor = humor.substring(0, 30) + '...';
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.cinza2,
            label: AppLocalizations.of(context)!.edit,
            icon: Icons.edit,
            onPressed: (context) {
              setarMaterialPageRoute(context, EditarDiario(idDiario));
            },
          ),
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: AppLocalizations.of(context)!.delete,
            icon: Icons.delete,
            onPressed: (context) {
              confirmarExclusaoDiario(context, idDiario, idAnimal);
            },
          ),
        ],
      ),
      child: Container(
        //height: 150,
        width: MediaQuery.of(context).size.width * 1,
        margin: EdgeInsets.only(left: 15, top: 10, right: 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            tituloDiario,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            humor,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 30,
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            dataDiarioFormatada,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 30,
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            peso.toString() + ' kg',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  //height: 75,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        descricaoDiario,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
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
