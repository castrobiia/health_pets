import './repository.dart';
import '../settings.dart';
import 'package:dio/dio.dart';
import 'package:health_pets/models/raca-model.dart';
import 'package:health_pets/repositories/repository.dart';

class RacaRepository implements Repository{

  Dio dio = new Dio();


  RacaRepository(){
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['accept'] = 'application/json';
  }

  @override
  Future<List<RacaModel>> getAll() async {
    var url = "${Settings.apiUrl}animal";
    Response response = await dio.get(url);
    return (response.data as List)
        .map((result) => RacaModel.fromJson(result))
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