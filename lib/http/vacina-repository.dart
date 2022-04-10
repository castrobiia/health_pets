import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VacinaRepository {
  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  getVacina(int id) async {
    String url = 'https://www.healthpets.app.br/api/vacina/${id}';

    print('URL VACINA: $url');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.get(Uri.parse(url), headers: headerToken);
    var vacinas = jsonDecode(response.body);
  }

  postVacina(int id_animal) async {
    String url = 'https://www.healthpets.app.br/api/vacina/${id_animal}';

    print('URL POST VACINA: $url');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.post(Uri.parse(url), headers: headerToken);
    var vacinas = jsonDecode(response.body);
  }
}
