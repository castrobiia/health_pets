import 'package:flutter/material.dart';
import 'package:health_pets/pages/calendario.page.dart';
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
      exibirMensagem(context, 'Selecione uma data');
    }

    dataController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  @override
  Widget build(BuildContext context) {
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
          color: Colors.white,
          padding: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: false,
                controller: categoriaController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _categoria = input!,
                decoration: InputDecoration(
                  labelText: "Categoria",
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
                controller: subcategoriaController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _subcategoria = input!,
                decoration: InputDecoration(
                  labelText: "Subcategoria",
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
                controller: animalController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _animal = input!,
                decoration: InputDecoration(
                  labelText: "Animal",
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
                  labelText: "Localização",
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
                  labelText: "Valor",
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
                  labelText: "Descrição",
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
                title: Text(AppLocalizations.of(context)!.addAlert),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
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
            ],
          ),
        ),
      ),
    );
  }
}
