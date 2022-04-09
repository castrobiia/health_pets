import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/class/api/header.dart';
import 'package:http/http.dart' as http;

class RacaEntity {
  List listaRacas = [];

  getRacasPorEspecie(String id) async {
    var url = 'https://www.healthpets.app.br/api/especie/${id}/racas';

    final response =
        await http.get(Uri.parse(url), headers: Header().getHeader());
    var racas = jsonDecode(response.body);

    return listaRacas = racas;
  }
}
