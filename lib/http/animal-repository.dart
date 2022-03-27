import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:health_pets/class/util.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/animal-model.dart';

class AnimalRepository {
  Future<List<AnimalModel>> fetchAnimais() async {
    Dio dio = Dio();

    String token = Util.getPreferences('token') as String;

    dio.options.headers['content-Type'] = 'application/json';

    dio.options.headers["Authorization"] = "Bearer ${token}";

    final url = "https://www.healthpets.app.br/api/animal";

    final response = await dio.get(url);
    final list = response.data as List;

    List<AnimalModel> animais = [];
    for (var json in list) {
      final animal = AnimalModel.fromJson(json);
      animais.add(animal);
    }
    return animais;
  }
}
