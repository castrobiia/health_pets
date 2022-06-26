import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:health_pets/class/util.dart';

import 'package:health_pets/models/animal-model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class AnimalRepository {
  List listaAnimais = [];
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
    print('animais: $animais');
    return animais;
  }

  Future<dynamic> getAnimais() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };
    final response = await http.get(Uri.parse(url), headers: header);
    var animais = jsonDecode(response.body);
    return animais;
  }

  List<AnimalModel> toListAnimal(dynamic listaAnimais) {
    List<AnimalModel> list = [];
    list = (listaAnimais as List)
        .map((item) => AnimalModel.fromJson(item))
        .toList();
    return list;
  }

  List<AnimalModel> toList(dynamic animais) {
    List<AnimalModel> list = [];
    list = (listaAnimais as List)
        .map((item) => AnimalModel.fromJson(item))
        .toList();
    return list;
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
    if (foto != 'default.png') {
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

    final response =
        await http.post(Uri.parse(url), body: body, headers: headerToken);
    print('Animal ${response.body}');
    return jsonDecode(response.body);
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

  putAnimal(String nome, String data_nascimento, String id_especie,
      String id_raca, String foto, int id, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var uri = Uri.parse("https://healthpets.app.br/api/animal/${id}");
    var body = jsonEncode({
      'nome': nome,
      'data_nascimento': data_nascimento,
      'id_especie': id_especie,
      'id_raca': id_raca,
      'foto': foto,
    });

    var response = await http.put(uri, body: body, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}",
    });

    return response.statusCode;
  }

  updateFoto(context, String foto, id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var pic = await http.MultipartFile.fromPath("foto", foto);

    var request = http.MultipartRequest(
        "POST", Uri.https('healthpets.app.br', 'api/animal/foto'));
    request.headers.addAll(headerToken);
    request.fields['id'] = id.toString();
    request.files.add(pic);

    final response = await request.send();
    Navigator.pushNamed(context, '/home', arguments: Argumentos(id));
  }
}
