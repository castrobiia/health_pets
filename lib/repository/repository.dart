import 'package:health_pets/models/animal-model.dart';

abstract class Repository {
  Future<String> deleteAnimal(id);
}
