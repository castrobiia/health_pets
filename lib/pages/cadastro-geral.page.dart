import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/repository/cadastro-geral-repository.dart';
import 'package:health_pets/repository/subcategoria-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CadastroGeral extends StatefulWidget {
  int idAnimal;
  CadastroGeral(this.idAnimal);

  @override
  _CadastroGeralState createState() => _CadastroGeralState(this.idAnimal);
}

class _CadastroGeralState extends State<CadastroGeral> {
  String? _data, _descricao, _local, _valor;
  int idAnimal;
  var idCategoria, idSubcategoria;
  List listaSubcategoria = [];

  _CadastroGeralState(this.idAnimal);

  TextEditingController categoriaController = TextEditingController();
  TextEditingController subCategoriaController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController dataSemFormatacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  setSubcategoria(id) async {
    var list = await SubcategoriaRepository().getSubcategoriasPorCategoria(id);
    setState(() {
      listaSubcategoria = list;
    });
  }

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(() {
        dataController.text = _datePicker.toString();
        dataSemFormatacaoController.text = dataController.text;
      });
    } else {
      exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  @override
  Widget build(BuildContext context) {
    var categoriaId, subcategoriaId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.registerGeneral,
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
                  List<dynamic> listaEspecies =
                      EspecieEntity().toList(snapshot.data);
                  return Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                DropdownButtonFormField(
                                  hint: Text(
                                      AppLocalizations.of(context)!.species),
                                  validator: (value) {
                                    if (value == null) {
                                      return AppLocalizations.of(context)!
                                          .selectSpecie;
                                    }
                                    return null;
                                  },
                                  onSaved: (input) =>
                                      _categoria = input!.toString(),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                  items: listaCategoria.map((item) {
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
                                      setSubcategoria(categoriaController.text);
                                    });
                                  },
                                  value: categoriaId,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  hint:
                                      Text(AppLocalizations.of(context)!.breed),
                                  validator: (value) {
                                    if (value == null) {
                                      return AppLocalizations.of(context)!
                                          .selectBreed;
                                    }
                                    return null;
                                  },
                                  onSaved: (input) =>
                                      _categoria = input!.toString(),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                  items: listaSubcategorias.map((item) {
                                    return DropdownMenuItem(
                                      child: new Text(
                                        item['nome'],
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      value: item['id'],
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      subcategoriaController.text =
                                          newValue.toString();
                                    });
                                  },
                                  value: subcategoriaId,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                setarCampoForms(valorController,
                                    AppLocalizations.of(context)!.price, _valor,
                                    validator: (value) => validarCampo(value)),
                                TextFormField(
                                  autofocus: false,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return AppLocalizations.of(context)!
                                          .selectDate;
                                    }
                                    return null;
                                  },
                                  onSaved: (input) => _data = input!,
                                  decoration: InputDecoration(
                                    labelText:
                                        AppLocalizations.of(context)!.date,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                  controller: dataController,
                                  readOnly: true,
                                  onTap: () {
                                    setState(
                                      () {
                                        _dataSelecionada(context);
                                      },
                                    );
                                  },
                                ),
                                SizedBox(height: 10),
                                setarCampoForms(
                                    localController,
                                    AppLocalizations.of(context)!.localization,
                                    _local,
                                    validator: (value) => validarCampo(value)),
                                TextFormField(
                                  controller: descricaoController,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!
                                        .description,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  maxLength: 250,
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

                                        String valor = valorController.text;
                                        var id_animal = this.idAnimal;
                                        var id_categoria = this.idCategoria;
                                        var id_subcategoria =
                                            this.idSubcategoria;
                                        String data =
                                            dataSemFormatacaoController.text;
                                        String local = localController.text;
                                        String descricao =
                                            descricaoController.text;

                                        if (await CadastroGeralRepository()
                                                .postCadastroGeral(
                                                    valor,
                                                    id_animal.toString(),
                                                    id_categoria.toString(),
                                                    id_subcategoria.toString(),
                                                    data,
                                                    local,
                                                    descricao) ==
                                            200) {
                                          exibirMensagem(context,
                                              'Cadastrado com sucesso');
                                          setarMaterialPageRoute(
                                              context, DiarioPet(idAnimal));
                                        } else {
                                          exibirMensagem(context,
                                              'Não foi possível cadastrar');
                                        }
                                      }
                                    },
                                    child: textBotao(
                                        AppLocalizations.of(context)!.save),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
