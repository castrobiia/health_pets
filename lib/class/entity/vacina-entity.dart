import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:http/http.dart' as http;

class VacinaEntity {
  List listaVacinas = [];
  var url = 'https://www.healthpets.app.br/api/vacinas';

  Future<VacinaModel?> getVacinas(int? id) async {
    if (id != null) {
      url = 'https://www.healthpets.app.br/api/animal/${id}/vacina';
    }

    final response =
        await http.get(Uri.parse(url), headers: Header().getHeader());

    var vacinas = jsonDecode(response.body);
    listaVacinas = vacinas;
  }
}
