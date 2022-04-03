import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/models/cadastro-animal-model.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  }

  late CadastroAnimalModel _cadastrarPetPage;
  TextEditingController nomeController = TextEditingController();
  TextEditingController especieController = TextEditingController();
  TextEditingController racaController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController dataNascimentoTesteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  String? _dataNascimento;
  String? _especie;
  String? _raca;

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  List listaEspecies = [];
  List listaRacas = [];

  Future<EspecieModel?> getAllEspecies() async {
    const url = 'https://www.healthpets.app.br/api/especie';

    final response = await http.get(Uri.parse(url), headers: header);
    var especies = jsonDecode(response.body);

    listaEspecies = especies;
  }

  getRacasPorEspecie(String id) async {
    String url = 'https://www.healthpets.app.br/api/especie/${id}/racas';

    print('URL: $url');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    final response = await http.get(Uri.parse(url), headers: headerToken);
    var racas = jsonDecode(response.body);

    setState(() {
      listaRacas = racas;
    });
  }

  @override
  Widget build(BuildContext context) {
    var especieId, racaId;

    Future<CadastroAnimalModel?> submitAnimal(String nome,
        String data_nascimento, String id_especie, String id_raca) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.get('token').toString();

      var headerToken = {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      };
      final response = await http.post(
          Uri.https('healthpets.app.br', 'api/animal'),
          headers: headerToken,
          body: {
            'nome': nome,
            'data_nascimento': data_nascimento,
            'id_especie': id_especie,
            'id_raca': id_raca
          });
      var status = response.statusCode;
      print('status: $status');
      var dados_animal = response.body;
      print('dados_animal: $dados_animal');
      if (status == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Animal cadastrado com sucesso')));
        setarMaterialPageRouteTab(context, PetPage());
      } else {
        print("erro ao cadastrar animal");
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                //salvar o estado do formulário
                _formKey.currentState!.save();

                String nome = nomeController.text;
                print(nome);
                String data_nascimento = dataNascimentoTesteController.text;
                print(data_nascimento);
                String id_especie = especieController.text;
                print(id_especie);
                String id_raca = racaController.text;
                print(id_raca);

                CadastroAnimalModel dadosAnimal = (await submitAnimal(
                        nome, data_nascimento, id_especie, id_raca))
                    as CadastroAnimalModel;

                setState(
                  () {
                    _cadastrarPetPage = dadosAnimal;
                  },
                );
              }
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
                FutureBuilder<dynamic>(
                  future: getAllEspecies(),
                  builder: (context, snapshot) {
                    return Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Preencha o nome";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _nome = input!,
                                controller: nomeController,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Selecione uma data";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _dataNascimento = input!,
                                decoration: InputDecoration(
                                  labelText: "Data de Nascimento",
                                  labelStyle: TextStyle(
                                    //color: Color(0xFFCC9396),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                                controller: dataNascimentoController,
                                readOnly: true,
                                onTap: () {
                                  setState(
                                    () {
                                      _dataSelecionada(context);
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField(
                                hint: Text("Espécie"),
                                validator: (value) {
                                  if (value==null) {
                                    return "Selecione a espécie";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _especie = input! as String?,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
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
                                    especieController.text =
                                        newValue.toString();
                                    getRacasPorEspecie(especieController.text);
                                  });
                                },
                                value: especieId,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField(
                                hint: Text("Raça"),
                                validator: (value) {
                                  if (value==null) {
                                    return "Selecione a raça";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _especie = input! as String?,
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
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
                                    racaController.text = newValue.toString();
                                  });
                                },
                                value: racaId,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
