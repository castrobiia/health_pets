import 'dart:convert';
import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/racas-model.dart';
import 'package:http/http.dart' as http;

class RacaEntity {
  List listaRacas = [];

  getRacasPorEspecie(String id) async {
    var url = 'https://www.healthpets.app.br/api/especie/${id}/racas';

    final response =
        await http.get(Uri.parse(url), headers: Header().getHeader());
    var racas = jsonDecode(response.body);

    listaRacas = toList(racas);
    return listaRacas;
  }

  List<RacasModel> toList(dynamic listaRacas) {
    List<RacasModel> list = [];
    list =
        (listaRacas as List).map((item) => RacasModel.fromJson(item)).toList();

    return list;
  }
}
