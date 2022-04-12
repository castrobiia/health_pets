import 'dart:convert';
import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:http/http.dart' as http;

class EspecieEntity {
  List listaEspecies = [];
  var url = 'https://www.healthpets.app.br/api/especie/';

  Future<dynamic> getEspecies() async {
    final response =
        await http.get(Uri.parse(url), headers: Header().getHeader());
    var especies = jsonDecode(response.body);
    return listaEspecies = especies;
  }

  List<EspecieModel> toList(dynamic listaEspecies) {
    List<EspecieModel> list = [];
    list = (listaEspecies as List)
        .map((item) => EspecieModel.fromJson(item))
        .toList();
    return list;
  }

  Future<dynamic> getEspecie(int id) async {
    final response = await http.get(Uri.parse(url + id.toString()),
        headers: Header().getHeader());

    dynamic especie = jsonDecode(response.body);

    return especie;
  }
}
