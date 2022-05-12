import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VacinaEntity {
  List listaVacinas = [];
  var url = 'https://www.healthpets.app.br/api/vacinas';

  Future<List?> getVacina(int? id) async {
    if (id != null) {
      url = 'https://www.healthpets.app.br/api/vacina/${id}';
    }

    final response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    return (jsonDecode(response.body)) as List;
  }

  Future<int> createVacina(context, String? nomeVacina, String? dataAplicacao,
      String? fabricante, String? lote, int? id_animal) async {
    String? _nomeVacina = nomeVacina;
    String? _dataAplicacao = dataAplicacao;
    String? _fabricante = fabricante;
    String? _lote = lote;
    int? _id_animal = id_animal;

    VacinaModel vacina = new VacinaModel();

    vacina.nome = _nomeVacina;
    vacina.data_aplicacao = _dataAplicacao;
    vacina.fabricante = _fabricante;
    vacina.lote = _lote;
    vacina.idAnimal = _id_animal;

    url = 'https://www.healthpets.app.br/api/vacina';

    final response = await http.post(Uri.parse(url),
        headers: Header().getHeader(), body: jsonEncode(vacina.toJson()));

    return response.statusCode;
  }

  // Future<String> deleteVacina(id) async {
  //   String urlHP = 'https://www.healthpets.app.br/api/vacina';
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = await prefs.get('token').toString();

  //   var headerToken = {
  //     "Content-Type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${token}"
  //   };

  //   var url = Uri.parse('$urlHP/${id}');
  //   var response = await http.delete(url, headers: headerToken);

  //   var vacina = jsonDecode(response.body);
  //   var mensagem = vacina['message'];

  //   return mensagem;
  // }
}
