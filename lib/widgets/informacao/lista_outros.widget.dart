import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/models/relatorio-model.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/info-model.dart';


class ListaOutros extends StatelessWidget {
  final InfoModel transaction;
  const ListaOutros(this.transaction);


  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.cinza2,
            label: AppLocalizations.of(context)!.edit,
            icon: Icons.edit,
            onPressed: (context) {},
          ),
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: AppLocalizations.of(context)!.delete,
            icon: Icons.delete,
            onPressed: (context) {
              //confirmarExclusaoDiario(context, idDiario, idAnimal);
            },
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: transaction.valor != null ? ColorTheme.rosa0 : ColorTheme.rosa0,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Icon(
                Icons.pets,
                color: transaction.valor != null ? Colors.white : Colors.white,
                size: 36,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(transaction.descricao!),
                      ),
                      Text(
                        "${transaction.valor != null ? "+" : "-"}${NumberFormat.simpleCurrency(
                          locale: 'pt_BR',
                        ).format(transaction.valor)}",
                        style: TextStyle(
                          color: transaction.valor != null
                              ? ColorTheme.roxo1
                              : ColorTheme.roxo1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat("dd MMM").format(DateTime.parse(transaction.data!)),
                      ),
                      Text(
                        transaction.descricao!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
