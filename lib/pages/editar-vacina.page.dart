import 'package:flutter/material.dart';
import 'package:health_pets/pages/pet.page.dart';

class EditarVacina extends StatelessWidget {
  const EditarVacina({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Editar Vacina",
          style: TextStyle(
            color: Color(0xFFF6BD87),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 30,
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/perfil-cao1.jpeg"),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 120,
                      child: FloatingActionButton(
                        child: Icon(Icons.add_a_photo), //ou upload, add, image
                        backgroundColor: Color(0xFFF6BD87),
                        //cor do ícone
                        foregroundColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Espécie",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Raça",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //formatar para receber data
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data de Nascimento",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //criar dropdown
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Sexo",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //criar dropdown
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Porte",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //criar dropdown
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Cor",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6BD87),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    boxShadow: [
                      new BoxShadow(
                        //cor do fundo (em volta) do container
                        color: Colors.black12,
                        //qnt de sombra
                        offset: new Offset(1, 2.0),
                        //expansao da sombra
                        blurRadius: 5,
                        //intensidade da borda
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                ),
                /* DropdownButtonFormField(
                    value: ValorInicialEspecie,
                    items: especies.map((items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (value) {}) */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
