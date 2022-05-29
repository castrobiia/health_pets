import 'package:flutter/material.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';

class PetCard extends StatelessWidget {
  final int idPet;
  final String fotoPet;
  final String nomePet;
  // XFile? image;

  PetCard({
    required this.idPet,
    required this.fotoPet,
    required this.nomePet,
  });

  @override
  Widget build(BuildContext context) {
    // image = XFile(fotoPet);

    getImage(foto) {
      if (foto == '' || foto == null) {
        return Column(
          children: [
            Image.network("https://healthpets.app.br/storage/pets/default.png")
          ],
        );
      } else {
        return Column(
          children: [
            Expanded(
                child:
                    Image.network("https://healthpets.app.br/storage/${foto}"))
          ],
        );
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 121,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(idPet)));
                },
                child: Container(
                  width: 100,
                  //MediaQuery.of(context).size.width * 0.3,
                  height: 100,
                  margin:
                      EdgeInsets.only(top: 5, left: 10, bottom: 10, right: 10),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          // child: (!kIsWeb && image != null
                          //     ? Image.file(File(image!.path))
                          //     : Container()),
                          //     child: Image.network("https://healthpets.app.br/storage/pets/$fotoPet"),
                          child: getImage(fotoPet)),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PerfilPetPage(idPet)));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  width: MediaQuery.of(context).size.width * 0.4,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        nomePet,
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
                height: 120,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PerfilPetPage(idPet)));
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
