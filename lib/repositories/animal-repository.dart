import 'dart:convert';
import 'package:health_pets/class/api/header.dart';
import 'package:health_pets/models/animal-model.dart';
import './repository.dart';
import '../settings.dart';
import 'package:http/http.dart' as http;

class AnimalRepository implements Repository{
  var client = http.Client();

  @override
  Future<AnimalModel> getOne(id) async {
    var url = Uri.parse("${Settings.apiUrl}animal/$id");
    var response = await client.get(url, headers: Header().getHeader());
    return (json.decode(response.body))
        .map((result) => AnimalModel.fromJson(result) as Map<dynamic, dynamic>)
        .toList();
  }

  Future<AnimalModel> getByUser() async{
    var url = Uri.parse("${Settings.apiUrl}animal");
    var response = await client.get(url, headers: Header().getHeader());
    var jsonDecoded = jsonDecode(response.body);
    return jsonDecoded
        .map((result) => AnimalModel.fromJson(result))
        .toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getAll() async{
    var url = Uri.parse("${Settings.apiUrl}animal");
    var response = await client.get(url, headers: Header().getHeader());
    if(response.statusCode == 200){
      return jsonDecode(jsonDecode(response.body))
          .map((result) => new Map.from(result))
          .toList();
      //return List<Map<String, AnimalModel>>.from(json.decode(response.body));
    }else{
      throw Exception('Failed to load Categories from API');
    }
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
