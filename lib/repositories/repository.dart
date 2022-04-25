import 'package:health_pets/models/animal-model.dart';

abstract class Repository {
  Future<List> getAll();
  Future getOne(id);
  Future insert();
  Future update(id);
  Future<String> delete(id);
}
