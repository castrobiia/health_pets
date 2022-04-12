import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioEntity {
  var url = 'https://www.healthpets.app.br/api/auth/me';

  getUsuario() async {
    //excluir quando resolver o erro: Unauthenticated
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };
    //usar Header().getHeader();, entender a mensagem de erro message: Unauthenticated.
    final response = await http.get(Uri.parse(url), headers: header);
    dynamic usuario = jsonDecode(response.body);

    return usuario;
  }
}
