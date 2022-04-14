import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/pages/perfil-pet.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../widgets/widgets.dart';

class EditarPetPage extends StatefulWidget {
  final id;

  const EditarPetPage(this.id);

  @override
  State<EditarPetPage> createState() => _EditarPetPageState(this.id);
}

Future<dynamic?> getAnimal(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token').toString();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${token}"
  };

  const url = 'https://www.healthpets.app.br/api/animal/';
  final response =
      await http.get(Uri.parse(url + id.toString()), headers: header);

  dynamic animal = jsonDecode(response.body);

  // print('Animal Function ${animal}');

  return animal;
}

Future<dynamic?> getEspecie(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token').toString();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${token}"
  };

  const url = 'https://www.healthpets.app.br/api/especie/';
  final response =
      await http.get(Uri.parse(url + id.toString()), headers: header);

  dynamic especie = jsonDecode(response.body);

  return especie;
}

Future<dynamic?> getRaca(int id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token').toString();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${token}"
  };

  const url = 'https://www.healthpets.app.br/api/raca/';
  final response =
      await http.get(Uri.parse(url + id.toString()), headers: header);

  dynamic raca = jsonDecode(response.body);

  return raca;
}

var dataNascimento;

class _EditarPetPageState extends State<EditarPetPage> {
  final id;
  _EditarPetPageState(this.id);

  DateTime _data = DateTime.now();
  var mensagemErro = 'Selecione uma data';

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(() {
        dataNascimentoController.text = _datePicker.toString();
        dataNascimentoTesteController.text = dataNascimentoController.text;
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagemErro)));
    }

    dataNascimentoController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));

    var valorInicial = null;
  }

  final dataNascimentoController = TextEditingController(text: dataNascimento);
  TextEditingController dataNascimentoTesteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Editar Pet",
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
            child: FutureBuilder<dynamic>(
              future: getAnimal(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  // return: show loading widget
                  //todo mostrar o loading
                  return Center(
                    child: Column(
                      children: [
                        Text('carregando getAnimal'),
                      ],
                    ),
                  );
                }
                if (snapshot.hasError) {
                  // return: show error widget
                  return Center(
                      child:
                          Container(child: Text('Erro ao carregar os dados')));
                }

                final animal = snapshot.data;

                dataNascimento = DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse(animal['data_nascimento']));

                print(dataNascimento);

                return FutureBuilder<dynamic>(
                  future: getEspecie(animal['id_especie']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      // return: show loading widget
                      //todo mostrar o loading
                      return Center(
                        child: Column(
                          children: [
                            Text('carregando getEspecie'),
                          ],
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      // return: show error widget
                      return Center(
                          child: Container(
                              child: Text('Erro ao carregar os dados')));
                    }

                    final especie = snapshot.data;

                    return FutureBuilder<dynamic>(
                        future: getRaca(animal['id_raca']),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            // return: show loading widget
                            //todo mostrar o loading
                            return Center(
                              child: Container(
                                child: Column(
                                  children: [
                                    Text('carregando getRaca'),
                                  ],
                                ),
                              ),
                            );
                          }
                          if (snapshot.hasError) {
                            // return: show error widget
                            return Center(
                                child: Container(
                                    child: Text('Erro ao carregar os dados')));
                          }

                          final raca = snapshot.data;

                          return Column(
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
                                        image: AssetImage(
                                            animal['foto'].toString()),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 120,
                                    left: 120,
                                    child: FloatingActionButton(
                                      child: Icon(Icons
                                          .add_a_photo), //ou upload, add, image
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
                                initialValue: animal['nome'],
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
                                //initialValue: dataNascimento,
                                decoration: InputDecoration(
                                  labelText: "Data de Nascimento",
                                  labelStyle: TextStyle(
                                    //color: Color(0xFFCC9396),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                                readOnly: true,
                                controller: dataNascimentoController,
                                onTap: () {
                                  setState(() {
                                    _dataSelecionada(context);
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                autofocus: false,
                                initialValue: especie['descricao'].toString(),
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
                                initialValue: raca['descricao'].toString(),
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
                                height: 50,
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
                                    setarMaterialPageRoute(context, PetPage());
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
                          );
                        });
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
