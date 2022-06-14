import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/vacina-entity.dart';

import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/cadastro-vacina-model.dart';
import 'package:health_pets/pages/arquivado/vacina.page.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../themes/color_theme.dart';

class CadastrarVacina extends StatefulWidget {
  const CadastrarVacina(this.idAnimal);
  final int idAnimal;

  @override
  _CadastrarVacinaState createState() => _CadastrarVacinaState(this.idAnimal);
}

class _CadastrarVacinaState extends State<CadastrarVacina> {
  bool checkedValue = true;
  DateTime _data = DateTime.now();

  final int idAnimal;
  _CadastrarVacinaState(this.idAnimal);

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(
        () {
          dataAplicacaoController.text = _datePicker.toString();
          dataAplicacaoTesteController.text = dataAplicacaoController.text;
        },
      );
    } else {
      exibirMensagem(context, 'Selecione uma data');
    }

    dataAplicacaoController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  late CadastroVacinaModel _cadastrarVacinaPage;
  TextEditingController nomeVacinaController = TextEditingController();
  TextEditingController dataAplicacaoController = TextEditingController();
  TextEditingController dataAplicacaoTesteController = TextEditingController();
  TextEditingController fabricanteController = TextEditingController();
  TextEditingController loteController = TextEditingController();
  TextEditingController animalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _nomeVacina;
  String? _dataAplicacao;
  String? _fabricante;
  String? _lote;
  String? _id_animal;

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  List listaVacinas = [];

  @override
  Widget build(BuildContext context) {
    final int idAnimal;

    _CadastrarVacinaState(this.idAnimal);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Adicionar Vacina",
          style: TextStyle(
            color: ColorTheme.salmao1,
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
                  title: Text(AppLocalizations.of(context)!.vaccineApplied),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          setarCampoForms(
                              nomeVacinaController, "Vacina", _nomeVacina,
                              validator: (value) => validarCampo(value)),
                          TextFormField(
                            autofocus: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Selecione uma data";
                              }
                              return null;
                            },
                            onSaved: (input) => _dataAplicacao = input!,
                            controller: dataAplicacaoController,
                            decoration: InputDecoration(
                              labelText: "Data da Aplicação",
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
                          SizedBox(height: 10),
                          setarCampoForms(loteController, "Lote", _lote,
                              validator: (value) => validarCampo(value)),
                          setarCampoForms(
                              fabricanteController, "Fabricante", _fabricante,
                              validator: (value) => validarCampo(value)),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            decoration: botaoRetangulo(),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  String nomeVacina = nomeVacinaController.text;
                                  String data_aplicacao =
                                      dataAplicacaoTesteController.text;
                                  String fabricante = fabricanteController.text;
                                  String lote = loteController.text;
                                  int id_animal = this.idAnimal;

                                  String data_aplicacao_teste =
                                      dataAplicacaoController.text;

                                  var vacina = await VacinaEntity()
                                      .createVacina(
                                          id_animal,
                                          nomeVacina,
                                          data_aplicacao,
                                          fabricante,
                                          lote,
                                          id_animal)
                                      .then((value) => value);

                                  if (vacina == 200) {
                                    setarMaterialPageRoute(
                                        context, VacinaPage(id_animal));
                                  }
                                }
                              },
                              child:
                                  textBotao(AppLocalizations.of(context)!.save),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
