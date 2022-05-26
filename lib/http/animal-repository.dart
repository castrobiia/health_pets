import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_pets/class/util.dart';

import 'package:health_pets/models/animal-model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/tabs.page.dart';
import '../widgets/widgets.dart';

class AnimalRepository {
  var url = "https://www.healthpets.app.br/api/animal";
  Future<List<AnimalModel>> fetchAnimais() async {
    Dio dio = Dio();

    String token = Util.getPreferences('token') as String;

    dio.options.headers['content-Type'] = 'application/json';

    dio.options.headers["Authorization"] = "Bearer ${token}";

    final response = await dio.get(url);
    final list = response.data as List;

    List<AnimalModel> animais = [];
    for (var json in list) {
      final animal = AnimalModel.fromJson(json);
      animais.add(animal);
    }
    return animais;
  }

  postAnimal(String nome, String data_nascimento, String id_especie,
      String id_raca, String foto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var body = jsonEncode({
      'nome': nome,
      'data_nascimento': data_nascimento,
      'id_especie': id_especie,
      'id_raca': id_raca,
      'foto': foto,
    });

    var pic;
    if(foto != 'default.png'){
      pic = await http.MultipartFile.fromPath("foto", foto);
    }

    var request = http.MultipartRequest(
        "POST", Uri.https('healthpets.app.br', 'api/animal'));
    request.headers.addAll(headerToken);
    request.fields["nome"] = nome;
    request.fields["data_nascimento"] = data_nascimento;
    request.fields["id_especie"] = id_especie;
    request.fields["id_raca"] = id_raca;
    request.files.add(pic);

    print(request.headers.toString());
    // final response =
    //     await http.post(Uri.parse(url), body: body, headers: headerToken);
    // return jsonDecode(response.statusCode.toString());
  }

  Future<List> findAllAnimais() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.get(Uri.parse(url), headers: header);
    final List decodedJson = jsonDecode(response.body);
    return decodedJson.map((json) => AnimalModel.fromJson(json)).toList();
  }

  getAnimal(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token').toString();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${token}"
  };

  const url = 'https://www.healthpets.app.br/api/animal/';
  final response =
      await http.get(Uri.parse(url + id.toString()), headers: header);

  // dynamic animal = jsonDecode(response.body);

  // print('Animal Function ${animal}');
  var animal = AnimalModel.fromJson(jsonDecode(response.body));

  // debugPrint("Variavel animal: ${animal.toString()}");
  // debugPrint("Objeto teste: ${test}");
  return animal;
  }

  // putAnimal(AnimalModel animal, int id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = await prefs.get('token').toString();
  //
  //   var headerToken = {
  //     "Accept": "application/json",
  //     "Authorization": "Bearer ${token}"
  //   };
  //
  //   // var body = jsonEncode({
  //   //   'nome': animal.nome,
  //   //   'data_nascimento': animal.dataNascimento,
  //   //   'id_especie': animal.idEspecie,
  //   //   'id_raca': animal.idRaca,
  //   //   'foto': animal.foto,
  //   // });
  //
  //   var pic;
  //
  //   // print(animal.foto);
  //   if (animal.foto != 'default.png') {
  //     pic = await http.MultipartFile.fromPath('foto', animal.foto!, contentType: MediaType('image', 'png'));
  //   }
  //
  //   var uri = Uri.parse("https://healthpets.app.br/api/animal/${id}");
  //   var request = http
  //       .MultipartRequest(
  //       'PUT',
  //       uri)..fields.addAll({
  //     'nome': animal.nome!,
  //       'data_nascimento': animal.dataNascimento!,
  //       'id_especie': animal.idEspecie!.toString(),
  //       'id_raca': animal.idRaca!.toString(),
  //       'foto': animal.foto!,
  //   });
  //       // ..fields["nome"] = animal.nome!
  //       // ..fields["data_nascimento"] = animal.dataNascimento!
  //       // ..fields["id_especie"] = animal.idEspecie.toString()
  //       // ..fields["id_raca"] = animal.idEspecie.toString()
  //       // ..files.add(pic);
  //   request.headers.addAll(headerToken);
  //   if(pic != null){
  //     request.files.add(pic);
  //   }
  //
  //   http.StreamedResponse retorno = await request.send();
  //
  //   final response = await retorno.stream.bytesToString();
  //   print(response);
  //   print(request.headers);
  //   print(retorno.request);
  //   print(retorno.reasonPhrase);
  //   print(retorno.statusCode);
  //   print(animal);
  // }
  putAnimal(String nome, String data_nascimento, String id_especie,
      String id_raca, String foto, int id, context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.get('token').toString();

    var uri = Uri.parse("https://healthpets.app.br/api/animal/${id}");
    var body = jsonEncode({
        'nome': nome,
        'data_nascimento': data_nascimento,
        'id_especie': id_especie,
        'id_raca':id_raca,
        'foto': foto,
      });
    var response = await http.put(
          uri,
          body: body,
          headers: {"Content-Type": "application/json",
                    "Accept": "application/json",
                    "Authorization": "Bearer ${token}",
          }
        );

    print(response.statusCode);
    if(response.statusCode == 200){
      Navigator.pushNamed(context, '/home');
    }
  }

}
