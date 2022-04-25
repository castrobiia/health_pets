// import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:health_pets/repositories/animal-repository.dart';

class AnimalController {
  List<AnimalModel> animais = [];
  final AnimalRepository _repository;
  // final AnimalRepositoryy _repositoryAnimal;
  AnimalState state = AnimalState.start;

  AnimalController(_repositoryAnimal, [AnimalRepository? repository])
      : _repository = repository ?? AnimalRepository();

  Future start() async {
    state = AnimalState.loading;
    try {
      // animais = await _repository.fetchAnimais();
      state = AnimalState.success;
    } catch (e) {
      state = AnimalState.error;
    }
  }

  // Future<String> deleteAnimal(id) async {
  //   // return _repositoryAnimal.deleteAnimal(id);
  // }
}

enum AnimalState { start, loading, success, error }
