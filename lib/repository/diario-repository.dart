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

  getDiario(int? id) async {
    url = '${url}/${id}';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.get(Uri.parse(url), headers: header);
    var diario = jsonDecode(response.body);
    return diario;
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

  putDiario(String id_diario, String peso, String humor, String descricao,
      String data, String titulo, String id_animal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var body = jsonEncode({
      'peso': peso,
      'humor': humor,
      'descricao': descricao,
      'data': data,
      'titulo': titulo,
      'id_animal': id_animal,
    });

    var urlPut = Uri.parse('$url/${id_diario}');

    var response = await http.put(urlPut, body: body, headers: header);
    return response.statusCode;
  }
}
