import 'package:flutter/material.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';

class CadastroLembrete extends StatefulWidget {
  const CadastroLembrete({Key? key}) : super(key: key);

  @override
  _CadastroLembreteState createState() => _CadastroLembreteState();
}

class _CadastroLembreteState extends State<CadastroLembrete> {
  @override
  Widget build(BuildContext context) {
    TextEditingController tituloController = TextEditingController();
    TextEditingController lembreteController = TextEditingController();
    TextEditingController localizacaoController = TextEditingController();
    TextEditingController dataController = TextEditingController();
    String? _titulo;
    String? _localizacao;
    String? _data;
    String? _lembrete;
    return SingleChildScrollView(
      child: AlertDialog(
        title: Text("Criar Lembrete"),
        content: Container(
          width: 200,
          height: 370,
          child: Column(
            children: [
              TextFormField(
                autofocus: false,
                keyboardType: TextInputType.text,
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
                controller: lembreteController,
                maxLines: 3,
                maxLength: 100,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _lembrete = input!,
                decoration: InputDecoration(
                  labelText: "Lembrete",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
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
                controller: dataController,
                validator: (value) => validarCampo(value),
                onSaved: (input) => _data = input!,
                decoration: InputDecoration(
                  labelText: "Data",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Confirmar',
              style: TextStyle(color: ColorTheme.rosa1),
            ),
          ),
        ],
      ),
    );
  }
}
