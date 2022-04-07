import 'package:flutter/material.dart';

import 'package:health_pets/controllers/vacina_controller.dart';
import 'package:health_pets/http/vacina-repository.dart';
import 'package:health_pets/links/links-pages.dart';
import 'package:health_pets/models/cadastro-vacina-model.dart';
import 'package:health_pets/pages/vacinas.page.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CadastrarVacina extends StatefulWidget {
  const CadastrarVacina(this.id);
  final int id;

  @override
  _CadastrarVacinaState createState() => _CadastrarVacinaState(this.id);
}

class _CadastrarVacinaState extends State<CadastrarVacina> {
  bool checkedValue = true;
  DateTime _data = DateTime.now();

  final int id;
  _CadastrarVacinaState(this.id);

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(
        () {
          VacinaController().dataAplicacaoController.text =
              _datePicker.toString();
          VacinaController().dataAplicacaoTesteController.text =
              VacinaController().dataAplicacaoController.text;
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione uma data'),
        ),
      );
    }

    VacinaController().dataAplicacaoController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  final _formKey = GlobalKey<FormState>();
  String? _nomeVacina;
  String? _dataAplicacao;
  String? _fabricante;
  String? _lote;

  // var header = {
  //   "Content-Type": "application/json",
  //   "Accept": "application/json"
  // };

  List listaVacinas = [];

  @override
  Widget build(BuildContext context) {
    final int id;

    _CadastrarVacinaState(this.id);

    Future<CadastroVacinaModel?> submitVacina(
        String nomeVacina,
        String data_aplicacao,
        String fabricante,
        String lote,
        String id_animal) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = await prefs.get('token').toString();

      var headerToken = {
        "Accept": "application/json",
        "Authorization": "Bearer ${token}"
      };
      final response = await http.post(
        Uri.https('healthpets.app.br', 'api/vacina'),
        headers: headerToken,
        body: {
          'nome': nomeVacina,
          'data_nascimento': data_aplicacao,
          'fabricante': fabricante,
          'lote': lote,
          'id_animal': id_animal
        },
      );
      var status = response.statusCode;
      print('status: $status');
      var dados_vacina = response.body;
      print('dados_vacina: $dados_vacina');
      if (status == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Vacina cadastrada com sucesso')));
        setarMaterialPageRoute(context, VacinaPage(this.id));
      } else {
        print("Erro ao cadastrar vacina");
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
                _formKey.currentState!.save();

                String nomeVacina =
                    VacinaController().nomeVacinaController.text;
                print(nomeVacina);
                String data_aplicacao =
                    VacinaController().dataAplicacaoController.text;
                print(data_aplicacao);
                String fabricante =
                    VacinaController().fabricanteController.text;
                print(fabricante);
                String lote = VacinaController().loteController.text;
                print(lote);
                String id_animal = VacinaController().animalController.text;
                print(id_animal);

                CadastroVacinaModel dadosVacina = (await submitVacina(
                    nomeVacina,
                    data_aplicacao,
                    fabricante,
                    lote,
                    id_animal)) as CadastroVacinaModel;

                setState(
                  () {
                    VacinaController().cadastrarVacinaPage = dadosVacina;
                  },
                );
              }
            },
            child: const Text("Salvar"),
          ),
        ],
        title: Text(
          "Adicionar Vacina",
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CheckboxListTile(
                  title: Text("Vacina aplicada"),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                FutureBuilder<dynamic>(
                  future: VacinaRepository().getVacinasPorAnimal(this.id),
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
                                    return "Preencha a vacina";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _lote = input!,
                                controller: VacinaController().loteController,
                                decoration: InputDecoration(
                                  labelText: "Vacina",
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
                                onSaved: (input) => _dataAplicacao = input!,
                                controller:
                                    VacinaController().dataAplicacaoController,
                                decoration: InputDecoration(
                                  labelText: "Data da Aplicação",
                                  labelStyle: TextStyle(
                                    //color: Color(0xFFCC9396),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
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
                              TextFormField(
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Preencha o lote";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _lote = input!,
                                controller: VacinaController().loteController,
                                decoration: InputDecoration(
                                  labelText: "Lote",
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
                              setarCampo(VacinaController().fabricanteController, "Fabricante", _fabricante, validator: (value)=> validarCampo(value)),
                              // TextFormField(
                              //   autofocus: false,
                              //   keyboardType: TextInputType.text,
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Preencha o fabricante";
                              //     }
                              //     return null;
                              //   },
                              //   onSaved: (input) => _fabricante = input!,
                              //   controller:
                              //       VacinaController().fabricanteController,
                              //   decoration: InputDecoration(
                              //     labelText: "Fabricante",
                              //     labelStyle: TextStyle(
                              //       //color: Color(0xFFCC9396),
                              //       fontWeight: FontWeight.w400,
                              //       fontSize: 17,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                /* Container(
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
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}


