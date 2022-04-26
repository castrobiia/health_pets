import 'package:flutter/material.dart';
import 'package:health_pets/blocs/especie.bloc.dart';
import 'package:health_pets/blocs/raca.bloc.dart';
import 'package:health_pets/models/animal-model.dart';

class CadastrarAnimalPage extends StatefulWidget {
  @override
  State<CadastrarAnimalPage> createState() => _CadastrarAnimalPage();
}

class _CadastrarAnimalPage extends State<CadastrarAnimalPage> {
  final _formKey =  GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var animal = new AnimalModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text("Salvar"),
          ),
        ],
        title: Text(
          "Cadastrar Pet",
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
            child: Form(
              key: _formKey,
              child: ListView(
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
                    onSaved: (value){
                      animal.nome = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: EspecieBloc().especies.map((item){
                      return DropdownMenuItem(
                          value: item.id,
                          child: Text(item.nome ?? ''),
                      );
                    }).toList(),
                    onChanged: (int? value){
                      animal.idEspecie = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: RacaBloc().racas.map((item){
                      return DropdownMenuItem(
                        value: item.id,
                        child: Text(item.nome ?? ''),
                      );
                    }).toList(),
                    onChanged: (int? value){
                      animal.idRaca = value!;
                    },
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
                    onSaved: (value){
                      animal.dataNascimento = value!;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
