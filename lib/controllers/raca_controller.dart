// #50
import 'package:health_pets/http/racas-repository.dart';
import 'package:health_pets/models/racas-model.dart';

class RacasController {
  List<RacasModel> racas = [];
  final RacasRepository _repository;
  RacaState state = RacaState.start;

  RacasController([RacasRepository? repository])
      : _repository = repository ?? RacasRepository();

  Future start() async {
    state = RacaState.loading;
    try {
      racas = await _repository.fetchRacas();
      state = RacaState.success;
    } catch (e) {
      state = RacaState.error;
    }
  }
}

enum RacaState { start, loading, success, error }
