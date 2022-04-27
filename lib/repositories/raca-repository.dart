import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../class/api/header.dart';
import './repository.dart';
import '../settings.dart';
import 'package:health_pets/models/raca-model.dart';
import 'package:health_pets/repositories/repository.dart';
import 'package:http/http.dart' as http;

class RacaRepository implements Repository{

  var client = http.Client();

  @override
  Future<List<RacaModel>> getAll() async {
    var url = Uri.parse("${Settings.apiUrl}animal");
    var response = await client.get(url, headers: Header().getHeader());
    debugPrint(" Body Response Raca ${response.body.toString()}");

    if(response.body.toString() != []){
      return (json.decode(response.body))
          .map((result) => List.from(result))
          .toList();
    }

    return [];
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