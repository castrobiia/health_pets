import '../repositories/especie-repository.dart';
import '../models/especie-model.dart';
import 'package:flutter/widgets.dart';

class EspecieBloc extends ChangeNotifier{
  final especieRepository = new EspecieRepository();

  List<EspecieModel> especies = [];

  EspecieBloc(){
    getEspecies();
  }

  getEspecies(){
    especieRepository.getAll().then((data) {
      this.especies = data;
      notifyListeners();
    });
  }
}