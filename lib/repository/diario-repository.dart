import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DiarioRepository {
  var url = 'https://www.healthpets.app.br/api/diario';

  postDiario(String titulo, String id_animal, String data, String humor,
      String peso, String descricao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final requestBody = jsonEncode({
      'titulo': titulo,
      'id_animal': id_animal,
      'data': data,
      'humor': humor,
      'peso': peso,
      'descricao': descricao,
    });

    var response =
        await http.post(Uri.parse(url), headers: header, body: requestBody);
    return jsonDecode(response.statusCode.toString());
  }

  Future<List?> getDiarios(int? id) async {
    url = '${url}/${id}';

    var response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    return (jsonDecode(response.body)) as List;
  }

  Future<String> deleteDiario(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var urlDelete = Uri.parse('$url/${id}');
    var response = await http.delete(urlDelete, headers: headerToken);
    var diario = jsonDecode(response.body);
    var mensagem = diario['message'];

    return mensagem;
  }
}
