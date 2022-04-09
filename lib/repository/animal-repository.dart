import 'dart:convert';

import 'package:health_pets/repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnimalRepositoryy implements Repository {
  String urlHP = 'https://www.healthpets.app.br/api/animal';

  @override
  Future<String> deleteAnimal(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var url = Uri.parse('$urlHP/${id}');
    var response = await http.delete(url, headers: headerToken);

    var animal = jsonDecode(response.body);
    var mensagem = animal['message'];

    return mensagem;
  }
}
