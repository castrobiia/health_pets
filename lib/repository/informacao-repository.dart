import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/info-model.dart';
import 'package:health_pets/models/relatorio-model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InformacaoRepository {
  var url = 'https://www.healthpets.app.br/api/info';

  postInformacao(
      String data,
      String descricao,
      String id_categoria,
      String id_subcategoria,
      String local,
      String valor,
      // String hora,
      // String alerta,
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
      // 'hora': hora,
      // 'alerta': alerta,
      'id_animal': id_animal,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);
    print('status code: ${response.statusCode}');
    print(response.body);
    return jsonDecode(response.statusCode.toString());
  }

  Future<List<InfoModel>> getSubcategoriaInfo(
      id_animal, id_subcategoria) async {
    var url = 'https://www.healthpets.app.br/api/saude';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    print('id_animal: {$id_animal}');
    print('id_subcategoria: {$id_subcategoria}');

    final body = jsonEncode({
      'id_subcategoria': id_subcategoria,
      'id_animal': id_animal,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);

    List<InfoModel> list = [];
    var resposta = jsonDecode(response.body) as List;

    for (var item in resposta) {
      var info = jsonDecode(jsonEncode(item));

      InfoModel part = InfoModel(
          id: info['id'],
          data: info['data'],
          descricao: info['descricao'],
          idCategoria: info['id_categoria'],
          idSubcategoria: info['id_subcategoria'],
          local: info['local'],
          valor: double.parse(info['valor'].toString()),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    return (list);
  }

  Future<List<InfoModel>> getInfoFood(int? id) async {
    url = 'https://www.healthpets.app.br/api/comida';

    var response = await http.post(Uri.parse(url),
        headers: Header().getHeader(), body: jsonEncode({'id': id}));

    List<InfoModel> list = [];
    var resposta = jsonDecode(response.body) as List;

    for (var item in resposta) {
      var info = jsonDecode(jsonEncode(item));

      InfoModel part = InfoModel(
          id: info['id'],
          data: info['data'],
          descricao: info['descricao'],
          idCategoria: info['id_categoria'],
          idSubcategoria: info['id_subcategoria'],
          local: info['local'],
          valor: double.parse(info['valor'].toString()),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    return (list);
  }

  Future getInfoHygiene(int? id) async {
    url = 'https://www.healthpets.app.br/api/higiene';

    var response = await http.post(Uri.parse(url),
        headers: Header().getHeader(), body: jsonEncode({'id': id}));

    List<InfoModel> list = [];
    var resposta = jsonDecode(response.body) as List;

    for (var item in resposta) {
      var info = jsonDecode(jsonEncode(item));

      InfoModel part = InfoModel(
          id: info['id'],
          data: info['data'],
          descricao: info['descricao'],
          idCategoria: info['id_categoria'],
          idSubcategoria: info['id_subcategoria'],
          local: info['local'],
          valor: double.parse(info['valor'].toString()),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    return (list);
  }

  Future getInfoAccessories(int? id) async {
    url = 'https://www.healthpets.app.br/api/acessorios';

    var response = await http.post(Uri.parse(url),
        headers: Header().getHeader(), body: jsonEncode({'id': id}));

    List<InfoModel> list = [];
    var resposta = jsonDecode(response.body) as List;

    for (var item in resposta) {
      var info = jsonDecode(jsonEncode(item));

      InfoModel part = InfoModel(
          id: info['id'],
          data: info['data'],
          descricao: info['descricao'],
          idCategoria: info['id_categoria'],
          idSubcategoria: info['id_subcategoria'],
          local: info['local'],
          valor: double.parse(info['valor'].toString()),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    return (list);
  }

  Future getInfoFun(int? id) async {
    url = 'https://www.healthpets.app.br/api/fun';

    var response = await http.post(Uri.parse(url),
        headers: Header().getHeader(), body: jsonEncode({'id': id}));

    List<InfoModel> list = [];
    var resposta = jsonDecode(response.body) as List;

    for (var item in resposta) {
      var info = jsonDecode(jsonEncode(item));

      InfoModel part = InfoModel(
          id: info['id'],
          data: info['data'],
          descricao: info['descricao'],
          idCategoria: info['id_categoria'],
          idSubcategoria: info['id_subcategoria'],
          local: info['local'],
          valor: double.parse(info['valor'].toString()),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    // print('Retorno lista de Fun: $list');

    return (list);
  }

  Future getInfo(int? id) async {
    url = 'https://www.healthpets.app.br/api/info/$id';

    var response =
        await http.get(Uri.parse(url), headers: Header().getHeader());

    var info = jsonDecode(response.body);

    print(info);
  }

  Future<List?> getInfosGeral(int? id) async {
    url = '${url}/${id}';

    var response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    return (jsonDecode(response.body)) as List;
  }

  Future<String> deleteInformacao(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var urlDelete = Uri.parse('$url/${id}');
    var response = await http.delete(urlDelete, headers: headerToken);
    var informacao = jsonDecode(response.body);
    var mensagem = informacao['message'];

    return mensagem;
  }
}
