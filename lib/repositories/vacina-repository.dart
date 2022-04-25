import './repository.dart';
import '../settings.dart';
import 'package:dio/dio.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:health_pets/repositories/repository.dart';

class VacinaRepository implements Repository{


  @override
  Future<List> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  Future<List<VacinaModel>> getAllByAnimal(id) async {
    var url = "${Settings.apiUrl}vacina/$id";
    Response response = await Dio().post(url);
    return (response.data as List)
        .map((result) => VacinaModel.fromJson(result))
        .toList();
  }

  @override
  Future<VacinaModel> getOne(id) async{
    var url = "${Settings.apiUrl}vacina/$id";
    Response response = await Dio().get(url);
    return (response.data)
        .map((result) => VacinaModel.fromJson(result))
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
  Future<String> delete(id) async{
    var url = "${Settings.apiUrl}vacina/$id";
    Response response = await Dio().delete(url);
    return (response.data)
        .map((result) => VacinaModel.fromJson(result))
        .toList();
  }

}