import 'dart:convert';
import 'package:http/http.dart' as http;
import '../class/api/header.dart';
import './repository.dart';
import '../settings.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:health_pets/repositories/repository.dart';

class EspecieRepository implements Repository{

  var client = http.Client();

  @override
  Future<List<EspecieModel>> getAll() async {
      var url = Uri.parse("${Settings.apiUrl}animal");
      var response = await client.get(url, headers: Header().getHeader());
      return (json.decode(response.body))
          .map((result) => EspecieModel.fromJson(result))
          .toList();
  }

  @override
  Future<String> delete(id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future getOne(id) {
    // TODO: implement getOne
    throw UnimplementedError();
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

}