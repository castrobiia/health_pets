import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:health_pets/pages/cadastro-pet.page.dart';
//coloca as funcoes dentro do objeto http
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request");
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response");
    print('status code: ${data.statusCode}');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}
/* 
class WebClient {
  List<EspecieModel> especies;

  WebClient({required this.especies});

  fromJson(Map<String, dynamic> json) {
    especies = <EspecieModel>[];
    json['especies'].forEach((v) {
      especies.add(new EspecieModel.fromJson(json));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.especies != null) {
      data['especies'] = this.especies.map((v) => v.toJson()).toList();
    }

    return data;
  }
}  */

class RepositoryEspecie {
  Future<List<EspecieModel>> findAllEspecies() async {
    final Client client = InterceptedClient.build(
      interceptors: [
        LoggingInterceptor(),
      ],
    );

    const url = 'https://www.healthpets.app.br/api/especie';
    final response = await client.get(Uri.parse(url));
    var titulo = jsonDecode(response.body);

    //decodificando o json
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<EspecieModel> especies = [];

    /* 
  for (Map<String, dynamic> especieJson in decodedJson) {
    final EspecieModel especiemodel = EspecieModel(
      especieJson['id'],
      especieJson['descricao'],
      especieJson['id_template'],
    );
    print('Especies: ${especiemodel}');
  }

  return especies; */
    print("TESTE RETURN");
    return decodedJson.map((json) => EspecieModel.fromJson(json)).toList();
    print(especies[0].descricao);

    /* 
  for (Map<String, dynamic> especieJson in decodedJson) {
    final especiemodel = EspecieModel.fromJson(especieJson);
    especies.add(especiemodel);
    print('Especies: ${especiemodel}');
  }
  print(especies[0].descricao);
  return especies; */

    print('DecodedJson ${decodedJson}');

    /* 
  var teste = response.body;

  List<String> especiesList = teste.split(",");

  Map<String, dynamic> decodedJson = jsonDecode(response.body);
  //final List<dynamic> decodedJson = jsonDecode(response.body);

  List<EspecieModel> especies = decodedJson.entries
      .map((entry) => EspecieModel(
          id: entry.key.toString(),
          descricao: entry.value.toString(),
          id_template: entry.key.toString()))
      .toList();

  print('Decoded Json: ${decodedJson}');

  print('Especies : ${especies}');

  //final List<EspecieModel> especies = decodedJson["especies"];

  /* for (Map<String, dynamic> element in especies) {
    EspecieModel(
        id: 'id', descricao: "descricao", id_template: ['id_template']);
  } */

  //decodedJson.forEach((key, value) {EspecieModel(id: 'id', descricao: ['descricao'], id_template: id_template)});


  final List<CadastrarPetPage> especies = [];
  for(Map<String, dynamic> element in decodedJson) {
  
  } */
  }
}
