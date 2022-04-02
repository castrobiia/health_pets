import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/models/cadastro-animal-model.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CadastrarPetPage extends StatefulWidget {
  @override
  State<CadastrarPetPage> createState() => _CadastrarPetPageState();
}

class _CadastrarPetPageState extends State<CadastrarPetPage> {
  DateTime _data = DateTime.now();
  var mensagemErro = 'Selecione uma data';

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    print('date picker: ${_datePicker}');

    if (_datePicker != null && _datePicker != _data) {
      setState(() {
        dataNascimentoController.text = _datePicker.toString();
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagemErro)));
    }

    dataNascimentoController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
    print(dataNascimentoController);
  }

  late CadastrarPetPage _cadastrarPetPage;
  TextEditingController nomeController = TextEditingController();
  TextEditingController especieController = TextEditingController();
  TextEditingController racaController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  List listaEspecies = [];
  List listaRacas = [];

  Future<EspecieModel?> getAllEspecies() async {
    const url = 'https://www.healthpets.app.br/api/especie';

    final response = await http.get(Uri.parse(url), headers: header);
    var especies = jsonDecode(response.body);

    setState(() {
      listaEspecies = especies;
    });
  }

  Future<EspecieModel?> getAllRacas() async {
    const url = 'https://www.healthpets.app.br/api/raca';

    final response = await http.get(Uri.parse(url), headers: header);
    var racas = jsonDecode(response.body);

    setState(() {
      listaRacas = racas;
    });
  }

  @override
  Widget build(BuildContext context) {
    var especieId, racaId;

    getAllEspecies();
    getAllRacas();

    Future<CadastroAnimalModel?> submitAnimal(String nome,
        String data_nascimento, int id_especie, int id_raca) async {
      final response = await http.post(
          Uri.https('healthpets.app.br', 'api/animal'),
          headers: header,
          body: {
            'nome': nome,
            'data_nascimento': data_nascimento,
            'id_especie': id_especie,
            'id_raca': id_raca
          });

      var dadosAnimal = response.body;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              String nome = nomeController.text;
              String data_nascimento = dataNascimentoController.text;
              int id_especie = especieController.text as int;
              int id_raca = racaController.text as int;

              CadastroAnimalModel dadosAnimal = (await submitAnimal(
                      nome, data_nascimento, id_especie, id_raca))
                  as CadastroAnimalModel;

              setState(() {
                _cadastrarPetPage = dadosAnimal as CadastrarPetPage;
              });
            },
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
                  controller: nomeController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //formatar para receber data
                  autofocus: false,
                  //keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    //hintText: (dataFormatada),
                    labelText: "Data de Nascimento",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    setState(() {
                      _dataSelecionada(context);
                    });
                  },

                  controller: dataNascimentoController,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  hint: Text("Espécie"),
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  items: listaEspecies.map((item) {
                    return DropdownMenuItem(
                      child: new Text(
                        item['descricao'],
                        style: TextStyle(fontSize: 17),
                      ),
                      value: item['id'].toString(),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      especieId = newValue;
                    });
                  },
                  value: especieId,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  hint: Text("Raça"),
                  style: TextStyle(fontSize: 17, color: Colors.black),
                  items: listaRacas.map((item) {
                    return DropdownMenuItem(
                      child: new Text(
                        item['descricao'],
                        style: TextStyle(fontSize: 17),
                      ),
                      value: item['id'].toString(),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      racaId = newValue;
                    });
                  },
                  value: racaId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
