import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/models/animal-model.dart';

class AnimalController {
  List<AnimalModel> animais = [];
  final AnimalRepository _repository;
  AnimalState state = AnimalState.start;

  AnimalController([AnimalRepository? repository])
      : _repository = repository ?? AnimalRepository();

  Future start() async {
    state = AnimalState.loading;
    try {
      animais = await _repository.fetchAnimais();
      state = AnimalState.success;
    } catch (e) {
      state = AnimalState.error;
    }
  }
}

enum AnimalState { start, loading, success, error }
