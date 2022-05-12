import 'package:health_pets/class/entity/vacina-entity.dart';
import 'package:health_pets/models/vacina-model.dart';
import 'package:health_pets/repository/repository.dart';
import 'package:health_pets/repository/vacina-repository.dart';

class VacinaController {
  List<VacinaModel> animais = [];
  final RepositoryV _repository;
  final RepositoryV _repositoryVacina;
  VacinaState state = VacinaState.start;

  var id;

  VacinaController(this._repositoryVacina, [RepositoryV? repository])
      : _repository = repository ?? RepositoryV();

  Future start() async {
    state = VacinaState.loading;
    try {
      animais = await _repository.getVacina(id);
      state = VacinaState.success;
    } catch (e) {
      state = VacinaState.error;
    }
  }

  Future<String> deleteVacina(id) async {
    return _repositoryVacina.deleteVacina(id);
  }
}

enum VacinaState { start, loading, success, error }
