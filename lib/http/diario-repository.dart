import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DiarioRepository {
  var url = 'https://www.healthpets.app.br/api/diario';

  postDiario(String titulo, int idAnimal, String data, String humor, int peso,
      String descricao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var response = await http.post(Uri.parse(url), headers: header);
    return jsonDecode(response.statusCode.toString());
  }
}
