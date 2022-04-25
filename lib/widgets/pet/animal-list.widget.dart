import 'package:health_pets/models/animal-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:health_pets/widgets/loader.widget.dart';
import 'animal-card.widget.dart';

class AnimalList extends StatelessWidget {
  late final List<AnimalModel> animais;

  AnimalList({required this.animais});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Loader(
        object: animais,
        callback: list,
      ),
    );
  }

  Widget list(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: animais.length,
        itemBuilder: (context, index){
          AnimalModel item = animais[index];
          return Container(
            child: AnimalCard(
              item: item,
            ),
          );
        },
    );
  }

}
