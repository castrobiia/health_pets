import '../repositories/raca-repository.dart';
import '../models/raca-model.dart';
import 'package:flutter/widgets.dart';

class RacaBloc extends ChangeNotifier{
  final racaRepository = new RacaRepository();

  List<RacaModel> racas = [];

  RacaBloc(){
    getRacas();
  }

  getRacas(){
    racaRepository.getAll().then((data){
      this.racas = data;
      notifyListeners();
    });
  }


}