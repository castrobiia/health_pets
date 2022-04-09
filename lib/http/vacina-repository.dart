import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:health_pets/models/vacina-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VacinaRepository {
  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  List listaVacinas = [];

  // Future<VacinaModel?> getAllVacinas(String id) async {
  //   const url = 'https://www.healthpets.app.br/api/especie/${id}/vacina';

  //   final response = await http.get(Uri.parse(url), headers: header);
  //   var vacinas = jsonDecode(response.body);

  //   listaVacinas = vacinas;
  // }

  getVacinasPorAnimal(int id) async {
    String url = 'https://www.healthpets.app.br/api/animal/${id}/vacina';

    print('URL: $url');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.get(Uri.parse(url), headers: headerToken);
    var vacinas = jsonDecode(response.body);
  }
}
