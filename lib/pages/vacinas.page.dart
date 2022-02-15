import 'package:flutter/material.dart';
import 'package:health_pets/widges/vacina/scrollab.widget.dart';
import 'package:health_pets/widges/vacina/vacina-list.dart';
import 'package:health_pets/widges/vacina/vacina-table.dart';


class VacinaPage extends StatefulWidget {
  @override
  _VacinaPageState createState() => _VacinaPageState();
}

class _VacinaPageState extends State<VacinaPage> {
  late List<Vacina> vacinas;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.vacinas = List.of(allVacinas);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Nome', 'Data Aplicação'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(vacinas),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Vacina> vacinas) => vacinas.map((Vacina vacina) {
        final cells = [vacina.nomeVacina, vacina.dataAplicacao];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      vacinas.sort((vacina1, vacina2) =>
          compareString(ascending, vacina1.nomeVacina, vacina2.nomeVacina));
    } else if (columnIndex == 1) {
      vacinas.sort((vacina1, vacina2) =>
          compareString(ascending, vacina1.dataAplicacao, vacina2.dataAplicacao));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
