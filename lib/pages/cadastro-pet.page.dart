import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/http/webclient.dart';
import 'package:health_pets/models/cadastro-animal-model.dart';
import 'package:health_pets/models/especie-model.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:http/http.dart' as http;

class CadastrarPetPage extends StatefulWidget {
  @override
  State<CadastrarPetPage> createState() => _CadastrarPetPageState();
}

class _CadastrarPetPageState extends State<CadastrarPetPage> {
  var ValorInicialEspecie = 'Gato';

  List<String> especies = ['Cachorro', 'Gato'];

  void initState() {
    super.initState();
  }

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
        String data = _datePicker as String;
        dataNascimentoController.text = data;

        print(_data.toString());
        print('controller');
        print(dataNascimentoController.text);
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(mensagemErro)));
    }
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

  @override
  Widget build(BuildContext context) {
    var especieId;
    List listaEspecies = [];

    const url = 'https://www.healthpets.app.br/api/especie';

    Future<EspecieModel> getAllEspecies() async {
      const url = 'https://www.healthpets.app.br/api/especie';

      var header = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        setState(() {
          var especies = jsonDecode(response.body);
        });
      } else {
        setState(() {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Erro ao carregar')));
        });
      }

      var especies = jsonDecode(response.body);

      setState(() {
        listaEspecies = especies['descricao'];
      });

      return especies;
    }

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

      print('VENDO OS DADOS DO ANIMAL ${dadosAnimal}');
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
                  controller: especieController,
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
                  controller: racaController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //formatar para receber data
                  autofocus: false,
                  //keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: (_data.toString()),
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
                /* 
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
                */
                DropdownButtonFormField(
                  value: ValorInicialEspecie,
                  items: especies.map((items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (value) {},
                ),
                DropdownButtonFormField(
                  items: listaEspecies.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(
                        item['descricao'],
                        style: TextStyle(fontSize: 12),
                      ),
                      value: item['id'].toString(),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      especieId = newValue;
                      print(especieId.toString());
                    });
                  },
                  value: especieId,
                ),
                /* DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: especieId,
                    iconSize: 30,
                    icon: (null),
                    hint: Text("Espécie"),
                    items: listaEspecies.map((item) {
                      return new DropdownMenuItem(
                        child: new Text(
                          item['descricao']), 
                          value: item['id'].toString(),
                        );
                    }).toList() ?? [],
                    onChanged: (String newValue) {
                    setState(() {
                      _myState = newValue;
                      getAllEspecies(id, descricao, id_template)
                      print(_myState);
                    },),
                    },
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}





/*

Future<EspecieModel> getAllEspecies(String id, String descricao) async {

  var header = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

  await http
      .post(Uri.parse(url), headers: header, body: {
    'id': id,
    'descricao': descricao,
    
  }).then((response) {
    var especies = jsonDecode(response.body);

    print('Espécies: ${especies}');
    setState(() {
      listaEspecies = especies['descricao'];
    });
  });
} */


