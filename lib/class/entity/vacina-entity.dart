import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/class/util.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:health_pets/pages/vacina.page.dart';
import 'package:http/http.dart' as http;

class VacinaEntity {
  List listaVacinas = [];
  var url = 'https://www.healthpets.app.br/api/vacinas';

  Future<VacinaModel?> getVacina(int? id) async {
    if (id != null) {
      url = 'https://www.healthpets.app.br/api/vacina/${id}';
    }

    final response =
        await http.post(Uri.parse(url), headers: Header().getHeader());

    var vacinas = jsonDecode(response.body);
    listaVacinas = vacinas;
  }

  Future<VacinaModel> createVacina(context, String? nomeVacina, String? dataAplicacao,
      String? fabricante, String? lote, int? id_animal) async {


    print("Passei aqui");

    String? _nomeVacina = nomeVacina;
    String? _dataAplicacao = dataAplicacao;
    String? _fabricante = fabricante;
    String? _lote = lote;
    int? _id_animal = id_animal;

    // VacinaModel vacina = VacinaModel.fromJson({
    //   'id': 0,
    //   'nome': _nomeVacina,
    //   'dataAplicacao': _dataAplicacao,
    //   'fabricante': _fabricante,
    //   'lote': _lote,
    //   'id_animal': _id_animal,
    // });


    VacinaModel vacina = new VacinaModel();



    vacina.nome = _nomeVacina;
    vacina.data_aplicacao = _dataAplicacao;
    vacina.fabricante = _fabricante;
    vacina.lote = _lote;
    vacina.idAnimal = _id_animal;

    // print("VacinaEntity Vacina criada: ${vacina.toString()}");
    //
    // // if (_id_animal != null) {
    // //   url = 'https://www.healthpets.app.br/api/vacina/${_id_animal}';
    // // }
    //
    url = 'https://www.healthpets.app.br/api/vacina';
    print(url);
    //
    final response =
        await http.post(Uri.parse(url), headers: Header().getHeader(), body: jsonEncode(vacina.toJson()));

    print(response.body);
    //
    // var vacinas = jsonDecode(response.body);
    // listaVacinas = vacinas;
    // debugPrint('vacina entity 2: $vacinas');
    // print('response body: ${response.body}');
    // //if (response.statusCode == 200) {
    //   //return setarMaterialPageRoute(context, VacinaPage(_id_animal!));
    //   return vacinas;
    // //}
    return new VacinaModel();
  }
}
