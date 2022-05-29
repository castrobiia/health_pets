import 'dart:convert';

import 'package:health_pets/models/subcategoria-model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubcategoriaRepository {
  Future<dynamic> getSubcategoriasPorCategoria(String int) async {
    // alterar url com o id categoria
    var url = 'https://www.healthpets.app.br/api/subcategoria';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var response = await http.get(Uri.parse(url), headers: header);
    var subcategorias = jsonDecode(response.body);
    return subcategorias;
  }

  List<SubcategoriaModel> toListSubcategoria(dynamic listaSubcategorias) {
    List<SubcategoriaModel> list = [];
    list = (listaSubcategorias as List)
        .map((item) => SubcategoriaModel.fromJson(item))
        .toList();
    return list;
  }
}
