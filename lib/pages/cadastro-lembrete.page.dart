import 'package:flutter/material.dart';
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
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController prioridadeController = TextEditingController();
  TextEditingController horaInicioController = TextEditingController();
  TextEditingController horaFimController = TextEditingController();

  String? _titulo;
  String? _localizacao;
  String? _data;
  String? _lembrete;

  bool checkedValue = false;
  DateTime _dataHoje = DateTime.now();

  var _datePicker, _timePickerInicio, _timePickerFim;

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
      exibirMensagem(context, 'Selecione uma data');
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  Future _horaInicioSelecionada(BuildContext context) async {
    _timePickerInicio = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(
      () {
        horaInicioController.text = _timePickerInicio!.format(context);
      },
    );
  }

  Future _horaFimSelecionada(BuildContext context) async {
    _timePickerFim = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    //validar se hora fim não é menor que hora início
    var earlier = _timePickerInicio;
    bool verificarHora = earlier.isBefore(_timePickerFim);

    if (_timePickerFim == _timePickerInicio) {
      exibirMensagem(context, 'Hora Início e Fim não podem ser iguais');
    } else if (verificarHora) {
      exibirMensagem(context, 'Hora Fim não pode ser menor que hora Início');
    } else {
      setState(
        () {
          horaFimController.text = _timePickerFim!.format(context);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "Salvar",
              style: TextStyle(color: ColorTheme.rosa1),
            ),
          ),
        ],
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
          color: Colors.white,
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: false,
                controller: tituloController,
                maxLength: 30,
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
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: dataController,
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
                readOnly: true,
                onTap: () {
                  setState(
                    () {
                      _dataSelecionada(context);
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      controller: horaInicioController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => _titulo = input!,
                      decoration: InputDecoration(
                        labelText: "Início",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        setState(
                          () {
                            _horaInicioSelecionada(context);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 25),
                  Expanded(
                    child: TextFormField(
                      autofocus: false,
                      readOnly: true,
                      controller: horaFimController,
                      validator: (value) => validarCampo(value),
                      onSaved: (input) => _titulo = input!,
                      decoration: InputDecoration(
                        labelText: "Fim",
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      onTap: () {
                        setState(
                          () {
                            _horaFimSelecionada(context);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: localizacaoController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _localizacao = input!,
                decoration: InputDecoration(
                  labelText: "Localização",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: prioridadeController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _lembrete = input!,
                decoration: InputDecoration(
                  labelText: "Prioridade",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
                controller: descricaoController,
                maxLines: 3,
                maxLength: 150,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _lembrete = input!,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
