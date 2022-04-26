import 'package:shared_preferences/shared_preferences.dart';

import '../models/animal-model.dart';
import '../repositories/animal-repository.dart';
import 'package:flutter/widgets.dart';

class HomeBloc extends ChangeNotifier{
  final animalRepository = new AnimalRepository();
  final prefs = SharedPreferences.getInstance();


  List<AnimalModel> animais = [];

  HomeBloc(){
    getAnimais();
  }

  //TODO implementar para pegar apenas os animais do usuário logado
  getAnimais(){
    animalRepository.getByUser().then((data) {
      this.animais = data;
      notifyListeners();
    });
  }

}