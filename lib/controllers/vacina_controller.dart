
import 'package:health_pets/models/vacina-model.dart';

class VacinaController {
  List<VacinaModel> racas = [];
  final VacinaRepository _repository;
  RacaState state = RacaState.start;

  VacinaController([VacinaRepository? repository])
      : _repository = repository ?? VacinaRepository();

  Future start() async {
    state = RacaState.loading;
    try {
      racas = await _repository.fetchVacina();
      state = RacaState.success;
    } catch (e) {
      state = RacaState.error;
    }
  }
}

enum RacaState { start, loading, success, error }
