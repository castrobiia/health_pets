import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:health_pets/pages/vacinas.page.dart';
import 'package:http/http.dart' as http;

class VacinaEntity {
  List listaVacinas = [];
  var url = 'https://www.healthpets.app.br/api/vacinas';

  Future<VacinaModel?> getVacinas(int? id) async {
    if (id != null) {
      url = 'https://www.healthpets.app.br/api/vacina/${id}';
    }

    final response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    var vacinas = jsonDecode(response.body);
    listaVacinas = vacinas;
  }

  Future<void> createVacina(context, String? nomeVacina, String? dataAplicacao,
      String? fabricante, String? lote, int? id_animal) async {
    String? _nomeVacina = nomeVacina;
    String? _dataAplicacao = dataAplicacao;
    String? _fabricante = fabricante;
    String? _lote = lote;
    int? _id_animal = id_animal;

    VacinaModel vacina = VacinaModel.fromJson({
      'id': 0,
      'nome': _nomeVacina,
      'dataAplicacao': _dataAplicacao,
      'fabricante': _fabricante,
      'lote': _lote,
      'id_animal': _id_animal,
    });

    if (_id_animal != null) {
      url = 'https://www.healthpets.app.br/api/vacina/${_id_animal}';
    }

    final response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    var vacinas = jsonDecode(response.body);
    listaVacinas = vacinas;
    if (response.statusCode == 200) {
      return setarMaterialPageRoute(context, VacinaPage(_id_animal!));
    }
  }
}
