import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/repository/diario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class EditarDiario extends StatefulWidget {
  int idDiario;
  EditarDiario(this.idDiario);

  @override
  _EditarDiarioState createState() => _EditarDiarioState(this.idDiario);
}

class _EditarDiarioState extends State<EditarDiario> {
  _EditarDiarioState(this.idDiario);

  @override
  var conexao;
  initState() {
    setState(() {
      conexao = DiarioRepository().getDiario(idDiario);
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController pesoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController dataSemFormatacaoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController humorController = TextEditingController();
  TextEditingController tituloController = TextEditingController();

  String? _peso, _titulo, _data, _descricao, _humor;
  int idDiario;

  var _datePicker;

  Future _dataSelecionada(BuildContext context) async {
    _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      dataController.text = _datePicker.toString();
      dataSemFormatacaoController.text = dataController.text;
    } else {
      exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  Widget build(BuildContext context) {
    print(idDiario);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.registerDiary,
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

                final diario = snapshot.data;

                pesoController.text = diario['peso'].toString();
                humorController.text = diario['humor'];
                descricaoController.text = diario['descricao'];
                // dataController.text = diario['data'];
                tituloController.text = diario['titulo'];
                dataController.text = DateFormat("dd/MM/yyyy")
                    .format(DateTime.parse(diario['data'].toString()));

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        controller: tituloController,
                        validator: (value) => validarCampo(value),
                        onSaved: (input) => _titulo = input!,
                        decoration: InputDecoration(
                          labelText: "Título",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autofocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Selecione uma data";
                          }
                          return null;
                        },
                        onSaved: (input) => _data = input!,
                        decoration: InputDecoration(
                          labelText: "Data",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        controller: dataController,
                        readOnly: true,
                        onTap: () {
                          _dataSelecionada(context);
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        controller: humorController,
                        validator: (value) => validarCampo(value),
                        onSaved: (input) => _humor = input!,
                        decoration: InputDecoration(
                          labelText: "Humor",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        controller: pesoController,
                        validator: (value) => validarCampo(value),
                        onSaved: (input) => _peso = input!,
                        decoration: InputDecoration(
                          labelText: "Peso",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        maxLength: 250,
                        controller: descricaoController,
                        validator: (value) => validarCampo(value),
                        onSaved: (input) => _peso = input!,
                        decoration: InputDecoration(
                          labelText: "Descrição",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
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

                              String titulo = tituloController.text;
                              String id_diario = diario['id'].toString();
                              String id_animal = diario['id_animal'].toString();
                              String humor = humorController.text;
                              String peso = pesoController.text;
                              String descricao = descricaoController.text;
                              var data;

                              var dataSemFormatacao =
                                  dataSemFormatacaoController.text;

                              if (dataSemFormatacao.isEmpty) {
                                data = diario['data'];
                              } else {
                                data = dataSemFormatacaoController.text;
                              }

                              print('data: ${data}');
                              print(titulo);
                              print(id_diario);
                              print(id_animal);
                              print(humor);
                              print(peso);
                              print(descricao);

                              if (await DiarioRepository().putDiario(
                                      id_diario,
                                      peso,
                                      humor,
                                      descricao,
                                      data,
                                      titulo,
                                      id_animal) ==
                                  200) {
                                exibirMensagem(
                                    context, 'Diário atualizado com sucesso');
                                setarMaterialPageRoute(
                                    context, DiarioPet(int.parse(id_animal)));
                              } else {
                                exibirMensagem(context,
                                    'Não foi possível atualizar diário');
                              }
                            }
                          },
                          child: textBotao(AppLocalizations.of(context)!.save),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
