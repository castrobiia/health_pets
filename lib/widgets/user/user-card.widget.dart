import 'package:flutter/material.dart';
import 'package:health_pets/blocs/user.bloc.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Container(
        color: Colors.white,
        child: ListView(
            children: <Widget>[
                SizedBox(
                    height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 80),
                    padding: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    ),
                    width: double.infinity,
                    height: 450,
                    decoration: boxDecoration(Colors.white),
                    // Todo descomentar para voltar ao estado principal.
                   child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                              //carregar imagem
                              BoxDecorationImagem(200,bloc.user.foto),
                              Text(
                                bloc.user.nome,
                                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              setarRowPerfil('E-mail', bloc.user.email),
                              divider(),
                              // alterar
                              setarRowPerfil('Animais', "5"),
                              divider(),
                          ],
                        ),
                ),
            ],
        ),
    );
  }
}
