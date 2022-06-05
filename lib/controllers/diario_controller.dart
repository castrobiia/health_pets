import 'package:health_pets/repository/diario-repository.dart';

class DiarioController {
  final DiarioRepository _diarioRepository;

  DiarioController(this._diarioRepository);

  Future<String> deleteDiario(id) async {
    return _diarioRepository.deleteDiario(id);
  }
}
