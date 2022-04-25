import 'package:flutter/material.dart';
import 'package:health_pets/blocs/home.bloc.dart';
import 'package:health_pets/models/animal-model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../pages/tabs-perfil-pet.page.dart';
import 'package:image_picker/image_picker.dart';
import '../../settings.dart';

class AnimalCard extends StatelessWidget {
  AnimalModel item;
  XFile? image;

  AnimalCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      height: 121,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(item.id)));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 5, left: 10, bottom: 10),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text('Foto'),
                        // (!kIsWeb && image != null
                        //     ? Image.file(File(image!.path))
                        //     : Container()),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(item.id)));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 200,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        item.nome,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PerfilPetPage(item.id)));
                        },
                        icon: Icon(Icons.navigate_next))
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.black12,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
