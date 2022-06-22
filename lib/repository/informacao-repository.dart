import 'dart:convert';

import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/info-model.dart';
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
    return jsonDecode(response.statusCode.toString());
  }

  Future<List> getSubcategoriaInfo(id_animal, id_subcategoria) async {
    var url = 'https://www.healthpets.app.br/api/saude';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    print('id_animal: $id_animal');
    print('id_subcategoria: $id_subcategoria');

    final body = jsonEncode({
      'id_subcategoria': id_subcategoria,
      'id_animal': id_animal,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);

    List list = [];
    var resposta = jsonDecode(response.body) as List;

    return resposta;
  } 

  Future<List<InfoModel>> getInfoFood(int? id) async {
    url = 'https://www.healthpets.app.br/api/comida';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    print('id: $id');

    final body = jsonEncode({
      'data': data,
      'descricao': descricao,
      'id_categoria': id_categoria,
      'id_subcategoria': id_subcategoria,
      'local': local,
      'valor': valor,
      // 'hora': hora,
      // 'alerta': alerta,
      'id_animal': id_animal,)
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);

    List list = [];
    var resposta = jsonDecode(response.body) as List;

    return resposta;

    // var response = await http.post(Uri.parse(url),
    //     headers: Header().getHeader(), body: jsonEncode({'id': id}));

    // List<InfoModel> list = [];
    // var resposta = jsonDecode(response.body) as List;

    // for (var item in resposta) {
    //   var info = jsonDecode(jsonEncode(item));

    //   InfoModel part = InfoModel(
    //       id: info['id'],
    //       data: info['data'],
    //       descricao: info['descricao'],
    //       idCategoria: info['id_categoria'],
    //       idSubcategoria: info['id_subcategoria'],
    //       local: info['local'],
    //       valor: info['valor'].toString(),
    //       idAnimal: info['id_animal']);

    //   list.add(part);
    // }

    // return list;
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
          valor: info['valor'].toString(),
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
          valor: info['valor'].toString(),
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
          valor: info['valor'].toString(),
          idAnimal: info['id_animal']);

      list.add(part);
    }

    return (list);
  }

  Future getInfo(int? id) async {
    url = 'https://www.healthpets.app.br/api/info/$id';

    var response =
        await http.get(Uri.parse(url), headers: Header().getHeader());

    var info = jsonDecode(response.body);

    InfoModel part = InfoModel(id: info['id'],
        data: info['data'],
        descricao: info['descricao'],
        idCategoria: info['id_categoria'],
        idSubcategoria: info['id_subcategoria'],
        local: info['local'],
        valor: info['valor'].toString(),
        idAnimal: info['id_animal']
    );

    print(part.toString());

    return part;

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

  List<InfoModel> toList(dynamic listaInfos) {
    List<InfoModel> list = [];
    list = (listaInfos as List)
        .map((item) => InfoModel(
            id: item['id'],
            data: item['data'],
            descricao: item['descricao'],
            idCategoria: item['idCategoria'],
            idSubcategoria: item['idSubcategoria'],
            local: item['local'],
            valor: item['valor'].toString(),
            idAnimal: item['idAnimal']))
        .toList();
    return list;
  }
}
