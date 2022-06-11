import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/repository/diario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditarDiario extends StatefulWidget {
  int idDiario;
  EditarDiario(this.idDiario);

  @override
  _EditarDiarioState createState() => _EditarDiarioState(this.idDiario);
}

class _EditarDiarioState extends State<EditarDiario> {
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
  _EditarDiarioState(this.idDiario);

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
                dataController.text = diario['data'];
                tituloController.text = diario['titulo'];

                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      setarCampoForms(tituloController,
                          AppLocalizations.of(context)!.title, _titulo,
                          validator: (value) => validarCampo(value)),

                      TextFormField(
                        autofocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppLocalizations.of(context)!.selectDate;
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
                        controller: dataController,
                        readOnly: true,
                        onTap: () {
                          setState(
                            () {
                              //_dataSelecionada(context);
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      setarCampoForms(humorController,
                          AppLocalizations.of(context)!.mood, _humor,
                          validator: (value) => validarCampo(value)),
                      //peso mudar para receber apenas numeros
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        controller: pesoController,
                        //validator: (value) => validarCampo(value),
                        onSaved: (input) => _peso = input!,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.weight,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: descricaoController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.description,
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

                              // String titulo = tituloController.text;
                              // var id_animal = this.idAnimal;
                              // String data = dataSemFormatacaoController.text;
                              // String humor = humorController.text;
                              // String peso = pesoController.text;
                              // String descricao = descricaoController.text;

                              // if (await DiarioRepository().postDiario(
                              //         titulo,
                              //         id_animal.toString(),
                              //         data,
                              //         humor,
                              //         peso,
                              //         descricao) ==
                              //     200) {
                              //   exibirMensagem(
                              //       context, 'Diário cadastrado com sucesso');
                              //   setarMaterialPageRoute(
                              //       context, DiarioPet(idAnimal));
                              // } else {
                              //   exibirMensagem(context,
                              //       'Não foi possível cadastrar diário');
                              // }
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
