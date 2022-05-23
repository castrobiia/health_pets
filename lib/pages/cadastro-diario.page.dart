import 'package:flutter/material.dart';
import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/pages/calendario.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CadastroDiario extends StatefulWidget {
  const CadastroDiario({Key? key}) : super(key: key);

  @override
  _CadastroDiarioState createState() => _CadastroDiarioState();
}

class _CadastroDiarioState extends State<CadastroDiario> {
  String? _peso, _titulo, _data, _descricao, _humor, _animal;

  TextEditingController pesoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController humorController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController animalController = TextEditingController();

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(() {
        dataController.text = _datePicker.toString();
      });
    } else {
      exibirMensagem(context, 'Selecione uma data');
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  @override
  Widget build(BuildContext context) {
    var animalId;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Cadastrar Diário",
          style: TextStyle(
            color: ColorTheme.salmao1,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            height: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
              ),
              child: Form(
                child: Column(children: [
                  setarCampoForms(tituloController, "Título", _titulo,
                      validator: (value) => validarCampo(value)),
                  FutureBuilder<dynamic>(
                      future: AnimalRepository().getAnimais(),
                      builder: (context, snapshot) {
                        // if (snapshot.connectionState != ConnectionState.done) {
                        //   return Center(
                        //       child: Container(
                        //           child: CircularProgressIndicator()));
                        // }
                        // if (snapshot.hasError) {
                        //   return Center(
                        //     child: Container(
                        //       child: Text(
                        //           AppLocalizations.of(context)!.errorLoading),
                        //     ),
                        //   );
                        // }
                        List<dynamic> listaAnimais =
                            AnimalRepository().toListAnimal(snapshot.data);
                        return DropdownButtonFormField(
                          hint: Text(AppLocalizations.of(context)!.animal),
                          validator: (value) {
                            if (value == null) {
                              return "Selecione o animal";
                            }
                            return null;
                          },
                          onSaved: (input) => _animal = input!.toString(),
                          style: TextStyle(fontSize: 17, color: Colors.black),
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
                        );
                      }),
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
                      setState(
                        () {
                          _dataSelecionada(context);
                        },
                      );
                    },
                  ),
                  setarCampoForms(humorController, "Humor", _humor,
                      validator: (value) => validarCampo(value)),
                  //peso mudar para receber apenas numeros
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    controller: pesoController,
                    //validator: (value) => validarCampo(value),
                    onSaved: (input) => _peso = input!,
                    decoration: InputDecoration(
                      labelText: "Peso",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Descrição",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    maxLength: 1000,
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
                      child: textBotao("Salvar"),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
