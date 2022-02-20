import 'package:flutter/material.dart';

class TabelaVacina extends StatelessWidget {
  const TabelaVacina({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Nome',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Data da Aplicacao',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Lote',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('V8')),
            DataCell(Text('19/10/2012')),
            DataCell(Text('8475632')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('V10')),
            DataCell(Text('17/12/2012')),
            DataCell(Text('7591663')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Antirabica')),
            DataCell(Text('27/08/2013')),
            DataCell(Text('1679834')),
          ],
        ),
      ],
    );
  }
}
