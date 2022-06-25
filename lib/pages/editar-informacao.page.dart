
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:health_pets/models/info-model.dart';
import 'package:health_pets/pages/tabs-perfil-pet.page.dart';
import 'package:health_pets/repository/categoria-repository.dart';
import 'package:health_pets/repository/informacao-repository.dart';
import 'package:health_pets/repository/subcategoria-repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../widgets/widgets.dart';

class EditarInformacao extends StatefulWidget {
  int idInfo;
  EditarInformacao(this.idInfo);


  @override
  _EditarInformacaoState createState() => _EditarInformacaoState(this.idInfo);
}

class _EditarInformacaoState extends State<EditarInformacao> {
  int id;
  bool checkedValue = false;
  var _datePicker, _timePicker;
  late InfoModel info;
  DateTime _dataHoje = DateTime.now();
  String? _localizacao,_data,_subcategoria,_categoria,_valor,_descricao,_hora;

  _EditarInformacaoState(this.id);

  catchInfo(id) async{
    this.info = await InformacaoRepository().getInfo(id);
    return this.info;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController subcategoriaController = TextEditingController();
  TextEditingController animalController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController dataSemFormatacaoController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  List listaSubcategorias = [];

  Future _dataSelecionada(BuildContext context) async {
    _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 5));

    if (_datePicker != null && _datePicker != _data) {
      dataController.text = _datePicker.toString();
      dataSemFormatacaoController.text = dataController.text;
    } else {
      exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  Future _horaSelecionada(BuildContext context) async {
    _timePicker =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (_timePicker != null) {
        horaController.text = _timePicker.toString();
    }

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    horaController.text = localizations.formatTimeOfDay(_timePicker,
        alwaysUse24HourFormat: false);
  }

  setSubcateoria(id) async{
    var lista = await SubcategoriaRepository().getSubcategoriasPorCategoria(id);
    listaSubcategorias = lista;
  }

  @override
  void initState(){
    // info = InformacaoRepository().getInfo(id) as InfoModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    catchInfo(id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Editar Informações",
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
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: catchInfo(id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Container(
                            child: Text(AppLocalizations.of(context)!.errorLoading),
                          ),
                        );
                      }

                      // print('Snapshot ${InfoModel.fromJson(jsonDecode(jsonEncode(snapshot.data)))}');
                      InfoModel informacoes =  InfoModel.fromJson(jsonDecode(jsonEncode(snapshot.data)));
                      this.info = informacoes;
                      // Object? informacoes =  snapshot.data;


                      animalController.text = info.idAnimal.toString();
                      descricaoController.text = info.descricao!;
                      localizacaoController.text = info.local!;
                      // print('Data e hora ${info.data} ${info.hora}');
                      // dataSemFormatacaoController.text = info.data;
                      dataController.text =
                          DateFormat("dd/MM/yyyy").format(DateTime.parse(info
                              .data.toString()));
                      horaController.text = info.hora ?? '';
                      valorController.text = info.valor.toString();

                      return Column(
                          children: [
                            FutureBuilder(
                              future: CategoriaRepository().getCategorias(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return Center(
                                    child: Container(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Container(
                                      child: Text(AppLocalizations.of(context)!.errorLoading),
                                    ),
                                  );
                                }

                                List<dynamic> listaCategoria = CategoriaRepository()
                                    .toListCategoria(snapshot.data);

                                return DropdownButtonFormField(
                                  hint: Text(
                                      AppLocalizations.of(context)!.category),
                                  value: informacoes.idCategoria,
                                  items: listaCategoria.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        item.nome,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      value: item.id,
                                    );
                                  }).toList(),
                                  onSaved: (newValue) {
                                    _categoria = newValue.toString();
                                    subcategoriaController.text = _categoria.toString();
                                  },
                                  onChanged: (newValue) {
                                    setState(() {
                                      _categoria = newValue.toString();
                                      setSubcateoria(categoriaController.text);
                                    });
                                  },
                                );
                              },
                            ),
                            FutureBuilder(
                              future: SubcategoriaRepository().getSubcategoriasPorCategoria(info.idCategoria.toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState !=ConnectionState.done) {
                                  return Center(
                                      child:
                                      Container(
                                          child: CircularProgressIndicator()));
                                }
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Container(
                                      child: Text(
                                          AppLocalizations.of(context)!
                                              .errorLoading),
                                    ),
                                  );
                                }

                                List<dynamic> listaSubcategoria = SubcategoriaRepository()
                                    .toListSubcategoria(snapshot.data);

                                return DropdownButtonFormField(
                                  hint: Text(AppLocalizations.of(context)!.category),
                                  value: informacoes.idSubcategoria,
                                  items: listaSubcategoria.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        item.nome,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      value: item.id,
                                    );
                                  }).toList(),
                                  onSaved: (newValue) {
                                    subcategoriaController.text =newValue.toString();
                                  },
                                  onChanged: (newValue) {
                                    // setState(() {
                                      _subcategoria = newValue.toString();
                                      // subcategoriaController.text =
                                      //     newValue.toString();
                                    // });

                                  },
                                );
                              },
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    controller: dataController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .selectDate;
                                      }
                                      return null;
                                    },
                                    onSaved: (input) => _data = input!,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!
                                          .date,
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                      ),
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      _dataSelecionada(context);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    controller: horaController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .selectDate;
                                      }
                                      return null;
                                    },
                                    onSaved: (input) => _hora = input!,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!
                                          .hour,
                                      labelStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 17,
                                      ),
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      _horaSelecionada(context);
                                    },
                                  ),
                                )
                              ],
                            ),
                            TextFormField(
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              controller: localizacaoController,
                              validator: (value) => validarCampo(value),
                              onSaved: (input) => _localizacao = input!,
                              decoration: InputDecoration(
                                labelText: "Nome",
                                labelStyle: TextStyle(
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
                              keyboardType: TextInputType.number,
                              controller: valorController,
                              validator: (value) => validarCampo(value),
                              onSaved: (input) => _valor = input!,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.price,
                                labelStyle: TextStyle(
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
                              controller: descricaoController,
                              maxLines: 3,
                              maxLength: 150,
                              validator: (value) => validarCampo(value),
                              onSaved: (input) => _descricao = input!,
                              decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!
                                    .description,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                              CheckboxListTile(
                                title: Text(AppLocalizations.of(context)!.addAlert),
                                value: checkedValue,
                                onChanged: (newValue) {},
                                //   setState(() {
                                //     checkedValue = newValue!;
                                //   });
                                // },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: botaoRetangulo(),
                                child: TextButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      var id_categoria = _categoria!;
                                      var id_subcategoria = subcategoriaController.text;
                                      var id_animal = this.id;
                                      String data = dataSemFormatacaoController.text;
                                      String local = localizacaoController.text;
                                      var valor = valorController.text;
                                      String descricao = descricaoController.text;
                                      bool lembrete = checkedValue;
                                      var hora = horaController.text;

                                      var dataSemFormatacao =
                                          dataSemFormatacaoController.text;

                                      if (dataSemFormatacao.isEmpty) {
                                        data = informacoes.data!;
                                      } else {
                                        data = dataSemFormatacaoController.text;
                                      }

                                      if (lembrete == true &&
                                          horaController.text != null) {
                                        hora = horaController.text;
                                      }
                                      if (lembrete == true &&
                                          horaController.text.isEmpty) {
                                        hora = '00:00';
                                      } else if (lembrete == false) {
                                        hora = '00:00';
                                      }

                                      // print(id_categoria);
                                      // print(id_subcategoria);
                                      // print(data);
                                      // print(local);
                                      // print(valor);
                                      // print(descricao);
                                      // print(lembrete);
                                      // print(id_animal);
                                      print(hora);

                                      // if (await InformacaoRepository().updateInformacao(
                                      //     data,
                                      //     descricao,
                                      //     id_categoria,
                                      //     id_subcategoria,
                                      //     local,
                                      //     valor,
                                      //     hora,
                                      //     lembrete.toString(),
                                      //     id_animal.toString(), info.id.toString()) ==
                                      //     200) {
                                      //   exibirMensagem(context,
                                      //       'Informações cadastradas com sucesso');
                                      //   setarMaterialPageRoute(
                                      //       context, PerfilPetPage(info.idAnimal));
                                      // } else {
                                      //   exibirMensagem(context,
                                      //       'Não foi possível cadastrar informações');
                                      // }
                                    }
                                  },
                                  child: textBotao(AppLocalizations.of(context)!.save),
                                ),
                              )
                          ]
                      );
                    }
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
