import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:health_pets/class/util.dart';

import 'package:health_pets/models/animal-model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnimalRepository {
  Future<List<AnimalModel>> fetchAnimais() async {
    Dio dio = Dio();

    String token = Util.getPreferences('token') as String;

    dio.options.headers['content-Type'] = 'application/json';

    dio.options.headers["Authorization"] = "Bearer ${token}";

    final url = "https://www.healthpets.app.br/api/animal";

    final response = await dio.get(url);
    final list = response.data as List;

    List<AnimalModel> animais = [];
    for (var json in list) {
      final animal = AnimalModel.fromJson(json);
      animais.add(animal);
    }
    return animais;
  }

  postAnimal(String nome,String data_nascimento, String id_especie, String id_raca, String foto) async {
    String url = 'https://www.healthpets.app.br/api/animal';

    print('Nome: $nome, data_nascimento: $data_nascimento, id_especie: $id_especie,  id_raca: $id_raca, foto: $foto');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var body = jsonEncode({
      'nome': nome,
      'data_nascimento': data_nascimento,
      'id_especie': id_especie,
      'id_raca': id_raca,
      'foto': foto,
    });

    final response = await http.post(Uri.parse(url), body: body, headers: headerToken);
    return jsonDecode(response.statusCode.toString());
  }
}
