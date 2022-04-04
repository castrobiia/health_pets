
import 'package:flutter/cupertino.dart';
import 'package:health_pets/http/vacina-repository.dart';
import 'package:health_pets/models/cadastro-vacina-model.dart';
import 'package:health_pets/models/vacina-model.dart';

class VacinaController {
  List<VacinaModel> vacinas = [];

  late CadastroVacinaModel cadastrarVacinaPage;
  TextEditingController nomeVacinaController = TextEditingController();
  TextEditingController dataAplicacaoController = TextEditingController();
  TextEditingController dataAplicacaoTesteController = TextEditingController();
  TextEditingController fabricanteController = TextEditingController();
  TextEditingController loteController = TextEditingController();
  TextEditingController animalController = TextEditingController();
  

  final VacinaRepository _repository;
  VacinaState state = VacinaState.start;

  VacinaController([VacinaRepository? repository])
      : _repository = repository ?? VacinaRepository();

  Future start() async {
    state = VacinaState.loading;
    try {
      //vacinas = await _repository.fetchVacina();
      state = VacinaState.success;
    } catch (e) {
      state = VacinaState.error;
    }
  }
}

enum VacinaState { start, loading, success, error }
