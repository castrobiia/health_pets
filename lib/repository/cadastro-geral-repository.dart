import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CadastroGeralRepository {
  var url = 'https://www.healthpets.app.br/api/info';

  postCadastroGeral(
      String data,
      String descricao,
      String id_categoria,
      String id_subcategoria,
      String local, //ok
      String valor, //ok
      String id_animal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final body = jsonEncode({
      'data': data,
      'descricao': descricao,
      'id_categoria': id_categoria,
      'id_subcategoria': id_subcategoria,
      'local': local,
      'valor': valor,
      'id_animal': id_animal,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);
    print('status code: ${response.statusCode}');
    print(response.body);
    return jsonDecode(response.statusCode.toString());
  }

  Future<List?> getInfosGeral(int? id) async {
    url = '${url}/${id}';

    var response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    return (jsonDecode(response.body)) as List;
  }
}
