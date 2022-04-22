import 'package:flutter/material.dart';
import 'package:health_pets/http/vacina-repository.dart';

class TabelaVacina extends StatelessWidget {
  const TabelaVacina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var id;

    VacinaRepository()
        .getVacina(id)
        .then((vacinas) => vacinas.forEach((element) {
              print('id vacina: ${element.id}');
            }));

    return Scaffold(
      body: FutureBuilder<List>(
        future: VacinaRepository().getVacina(id),
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
                child: Text('Erro ao carregar os dados'),
              ),
            );
          }
          final list = snapshot.data ?? [];
          if (list.length == 0) {
            return Center(
              child: Text(
                'Não há vacinas cadastradas',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            );
          } else {
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
                DataColumn(
                  label: Text(
                    'Fabricante',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text('V8'),
                      nomeVacina: vacina.nomeVacina ?? 0,
                    ),
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
        },
      ),
    );
  }
}
