// #50
import 'package:health_pets/http/racas-repository.dart';
import 'package:health_pets/models/raca-model.dart';

class RacasController {
  List<RacaModel> racas = [];
  final RacasRepository _repository;
  RacaState state = RacaState.start;

  RacasController([RacasRepository? repository])
      : _repository = repository ?? RacasRepository();

  Future start() async {
    state = RacaState.loading;
    try {
      // Todo descomentar para voltar ao estado principal. racas = await _repository.fetchRacas();
      state = RacaState.success;
    } catch (e) {
      state = RacaState.error;
    }
  }
}

enum RacaState { start, loading, success, error }
