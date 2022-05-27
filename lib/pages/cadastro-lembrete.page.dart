import 'package:flutter/material.dart';
import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/repository/categoria-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CadastroLembrete extends StatefulWidget {
  const CadastroLembrete({Key? key}) : super(key: key);

  @override
  _CadastroLembreteState createState() => _CadastroLembreteState();
}

class _CadastroLembreteState extends State<CadastroLembrete> {
  TextEditingController categoriaController = TextEditingController();
  TextEditingController subcategoriaController = TextEditingController();
  TextEditingController animalController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController valorController = TextEditingController();

  String? _animal,
      _localizacao,
      _data,
      _subcategoria,
      _categoria,
      _valor,
      _descricao;

  bool checkedValue = false;
  DateTime _dataHoje = DateTime.now();

  var _datePicker;

  Future _dataSelecionada(BuildContext context) async {
    _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime(DateTime.now().year + 5));

    if (_datePicker != null) {
      setState(
        () {
          dataController.text = _datePicker.toString();
          //dataTesteController.text = dataController.text;
        },
      );
    } else {
      exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  var conexao, conexaoCategoria;
  initState() {
    setState(() {
      conexao = AnimalRepository().getAnimais();
      conexaoCategoria = CategoriaRepository().getCategorias();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var animalId, categoriaId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Criar Lembrete",
          style: TextStyle(
            color: ColorTheme.salmao1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: double.infinity,
          decoration: boxDecoration(Colors.white),
          child: Padding(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
            ),
            child: FutureBuilder<dynamic>(
                future: conexao,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                        child: Container(child: CircularProgressIndicator()));
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Container(
                        child: Text(AppLocalizations.of(context)!.errorLoading),
                      ),
                    );
                  }

                  List<dynamic> listaAnimais =
                      AnimalRepository().toListAnimal(snapshot.data);

                  return FutureBuilder<dynamic>(
                    future: conexaoCategoria,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                            child:
                                Container(child: CircularProgressIndicator()));
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Container(
                            child: Text(
                                AppLocalizations.of(context)!.errorLoading),
                          ),
                        );
                      }

                      List<dynamic> listaCategorias =
                          CategoriaRepository().toListCategoria(snapshot.data);

                      return Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            DropdownButtonFormField(
                              hint:
                                  Text(AppLocalizations.of(context)!.category),
                              validator: (value) {
                                if (value == null) {
                                  return AppLocalizations.of(context)!
                                      .selectCategory;
                                }
                                return null;
                              },
                              onSaved: (input) =>
                                  _categoria = input!.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              items: listaCategorias.map((item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item.nome,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  value: item.id,
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  categoriaController.text =
                                      newValue.toString();
                                });
                              },
                              value: categoriaId,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              autofocus: false,
                              controller: subcategoriaController,
                              validator: (value) => validarCampo(value),
                              onSaved: (input) => _subcategoria = input!,
                              decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.subcategory,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField(
                              hint: Text(AppLocalizations.of(context)!.animal),
                              validator: (value) {
                                if (value == null) {
                                  return AppLocalizations.of(context)!
                                      .selectAnimal;
                                }
                                return null;
                              },
                              onSaved: (input) => _animal = input!.toString(),
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              items: listaAnimais.map((item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item.nome,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  value: item.id,
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  animalController.text = newValue.toString();
                                });
                              },
                              value: animalId,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
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
                                labelText: AppLocalizations.of(context)!.date,
                                labelStyle: TextStyle(
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
                              controller: localizacaoController,
                              validator: (value) => validarCampo(value),
                              onSaved: (input) => _localizacao = input!,
                              decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.localization,
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
                                labelText:
                                    AppLocalizations.of(context)!.description,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CheckboxListTile(
                              title:
                                  Text(AppLocalizations.of(context)!.addAlert),
                              value: checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValue = newValue!;
                                });
                              },
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
                                onPressed: () {
                                  setarMaterialPageRoute(context, Calendario());
                                },
                                child: textBotao(
                                    AppLocalizations.of(context)!.save),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
