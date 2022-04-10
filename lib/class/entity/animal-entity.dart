import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AnimalEntity {
  var url = 'https://www.healthpets.app.br/api/animal/';
  Future<dynamic> getAnimal(int id) async {
    //excluir quando resolver o erro: Wrong number of segments
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    //usar Header().getHeader();, entender a mensagem de erro message: Wrong number of segments
    final response =
        await http.get(Uri.parse(url + id.toString()), headers: header);

    dynamic animal = jsonDecode(response.body);

    return animal;
  }
}
