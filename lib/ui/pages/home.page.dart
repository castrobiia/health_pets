import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/home.bloc.dart';
import '../../widgets/pet/animal-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Scaffold(
      body: Container(
        child: AnimalList(
          animais: bloc.animais,
        ),
      ) ,
    );
  }
}