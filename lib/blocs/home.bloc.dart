import '../models/animal-model.dart';
import '../repositories/animal-repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier{
  final animalRepository = new AnimalRepository();

  List<AnimalModel> animais = [];

  HomeBloc(){
    getAnimais();
  }

  //TODO implementar para pegar apenas os animais do usuário logado
  getAnimais(){
    animalRepository.getAll().then((data) {
      this.animais = data;
      notifyListeners();
    });
  }

}