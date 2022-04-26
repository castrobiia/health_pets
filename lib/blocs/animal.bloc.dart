import 'package:health_pets/blocs/home.bloc.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:health_pets/models/raca-model.dart';
import 'package:health_pets/settings.dart';

import '../models/animal-model.dart';
import '../repositories/animal-repository.dart';
import 'package:flutter/widgets.dart';

class AnimalBloc extends ChangeNotifier{
  final animalRepository = new AnimalRepository();

  List<AnimalModel> animais = [];

  AnimalBloc(){
    getAnimalByUser();
  }

  getAnimalByUser(){
    animalRepository.getByUser(Settings.user.id);
  }


}