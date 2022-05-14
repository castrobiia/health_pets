import 'package:health_pets/models/vacina-model.dart';
import 'package:health_pets/repository/repository.dart';

class VacinaController extends RepositoryV {
  List<VacinaModel> vacinas = [];
  final RepositoryV _repositoryVacina;

  var id;

  VacinaController(this._repositoryVacina);

  Future<String> deleteVacina(id) async {
    return _repositoryVacina.deleteVacina(id);
  }
}

