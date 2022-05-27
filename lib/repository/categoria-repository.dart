import 'dart:convert';

import 'package:health_pets/models/categoria-model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CategoriaRepository {
  var url = 'https://www.healthpets.app.br/api/categoria';

  Future<dynamic> getCategorias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var response = await http.get(Uri.parse(url), headers: header);
    var categorias = jsonDecode(response.body);
    print('categorias: $categorias');
    return categorias;
  }

  List<CategoriaModel> toListCategoria(dynamic listaCategorias) {
    List<CategoriaModel> list = [];
    list = (listaCategorias as List)
        .map((item) => CategoriaModel.fromJson(item))
        .toList();
    return list;
  }
}
