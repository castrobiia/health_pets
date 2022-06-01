import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SenhaRepository {
  var url = 'https://www.healthpets.app.br/api/auth/forgot';

  postEsqueceuSenha(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();
    print('token: $token');

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var body = jsonEncode({'email': email});

    var response = await http.post(Uri.parse(url), headers: header, body: body);
    print('url: $url');
    print('statusCode: ${response.statusCode}');
    print('body: ${response.body}');
    return jsonDecode(response.statusCode.toString());
  }
}
