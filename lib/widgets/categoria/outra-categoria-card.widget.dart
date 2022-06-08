import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:health_pets/models/relatorio-model.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/lista_gastos.widget.dart';

class OutraCategoriaCard {
  late String name;
  late String description;
  late double total;
  late bool isIncome;
  late DateTime createdAt;

  OutraCategoriaCard({
    required this.name,
    required this.description,
    required this.total,
    required this.isIncome,
    required this.createdAt,
  });
}

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
            confirmarExclusaoDiario(context, idDiario, idAnimal);
          },
        ),
      ],
    ),
    child: Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        title: Text(
          AppLocalizations.of(context)!.food,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: ColorTheme.salmao2,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Center(
            child: Icon(
              Icons.food_bank, //dining
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        children: [
          Column(
            children: incomeTransaction
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: ListaGastos(
                      transaction: e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    ),
  

  );
}
