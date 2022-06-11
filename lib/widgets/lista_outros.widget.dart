import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../models/relatorio-model.dart';
import '../themes/color_theme.dart';

class ListaOutros extends StatelessWidget {
  final RelatorioModel transaction;
  const ListaOutros({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: ColorTheme.cinza2,
            label: 'Editar',
            icon: Icons.edit,
            onPressed: (context) {},
          ),
          SlidableAction(
            backgroundColor: ColorTheme.vermelho1,
            label: 'Deletar',
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
              color: transaction.isIncome ? ColorTheme.rosa0 : ColorTheme.rosa0,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Icon(
                Icons.pets,
                color: transaction.isIncome ? Colors.white : Colors.white,
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
                        child: Text(transaction.name),
                      ),
                      Text(
                        "${transaction.isIncome ? "+" : "-"}${NumberFormat.simpleCurrency(
                          locale: 'pt_BR',
                        ).format(transaction.total)}",
                        style: TextStyle(
                          color: transaction.isIncome
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
                        DateFormat("dd MMM").format(transaction.createdAt),
                      ),
                      Text(
                        transaction.description,
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
