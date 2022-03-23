import 'package:flutter/material.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/especie-model.dart';

class EspecieController {
  List<EspecieModel> especies = [];
  final RepositoryEspecie _repositoryEspecie;

  //reatividade
  final state = ValueNotifier<EspecieState>(EspecieState.start);

  //iniciar
  //EspecieState state = EspecieState.start;

  //final repository = RepositoryEspecie();

  EspecieController([RepositoryEspecie? repository])
      : _repositoryEspecie = repository ?? RepositoryEspecie();

  start() async {
    // vai aguardar o especoes = await carregar trazendo as especies
    state.value = EspecieState.loading;
    try {
      especies = await _repositoryEspecie.findAllEspecies();
      state.value = EspecieState.success;
    } catch (e) {
      state.value = EspecieState.error;
    }

    /* especies = await repository.findAllEspecies();
    var tamEspecies = especies.length;
    print('tamEspecies: ${tamEspecies}'); */
  }
}

enum EspecieState { start, loading, success, error }
