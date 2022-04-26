import 'package:dio/dio.dart';
import 'package:health_pets/models/animal-model.dart';

import './repository.dart';
import '../settings.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnimalRepository implements Repository{


  @override
  Future<AnimalModel> getOne(id) async {
    var url = "${Settings.apiUrl}animal/$id";
    Response response = await Dio().get(url);
    return (response.data)
        .map((result) => AnimalModel.fromJson(result))
        .toList();
  }

  Future<List<AnimalModel>> getByUser() async{
    var url = "${Settings.apiUrl}animal";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((result) => AnimalModel.fromJson(result))
        .toList();
  }

  @override
  Future<List<AnimalModel>> getAll() async{
    var url = "${Settings.apiUrl}animal";
    Response response = await Dio().get(url);
    return (response.data as List)
        .map((result) => AnimalModel.fromJson(result))
        .toList();
  }

  @override
  Future insert() {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future update(id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<String> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
