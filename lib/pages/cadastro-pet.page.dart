import 'package:flutter/material.dart';
import 'package:health_pets/class/entity/especie-entity.dart';
import 'package:health_pets/class/entity/raca-entity.dart';
import 'package:health_pets/http/animal-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:health_pets/models/cadastro-animal-model.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:health_pets/class/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CadastrarPetPage extends StatefulWidget {
  @override
  State<CadastrarPetPage> createState() => _CadastrarPetPageState();
}

class _CadastrarPetPageState extends State<CadastrarPetPage> {
  DateTime _data = DateTime.now();
  final ImagePicker _picker = ImagePicker();
  XFile? pickedFile;

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      setState(() {
        dataNascimentoController.text = _datePicker.toString();
        dataNascimentoTesteController.text = dataNascimentoController.text;
      });
    } else {
      exibirMensagem(context, 'Selecione uma data');
    }

    dataNascimentoController.text =
        DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
  }

  late CadastroAnimalModel _cadastrarPetPage;
  TextEditingController nomeController = TextEditingController();
  TextEditingController especieController = TextEditingController();
  TextEditingController racaController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController dataNascimentoTesteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _nome;
  String? _dataNascimento;
  String? _especie;
  String? _raca;
  List listaRacas = [];

  setRacas(id) async {
    var list = await RacaEntity().getRacasPorEspecie(id);
    setState(() {
      listaRacas = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    var especieId, racaId;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                //salvar o estado do formulário
                _formKey.currentState!.save();

                String nome = nomeController.text;
                String data_nascimento = dataNascimentoTesteController.text;
                var id_especie = especieController.text;
                String id_raca = racaController.text;
                String foto = pickedFile?.path ?? 'default.png';

                if (await AnimalRepository().postAnimal(
                        nome, data_nascimento, id_especie, id_raca, foto) ==
                    '200') {}

                setarMaterialPageRoute(context, TabsPage());
              }
            },
            child: const Text("Salvar"),
          ),
        ],
        title: Text(
          "Cadastrar Pet",
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
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    BoxDecorationImagem(180, "assets/perfil-cao1.jpeg"),
                    Positioned(
                      top: 120,
                      left: 120,
                      child: FloatingActionButton(
                          child: Icon(Icons.add_a_photo),
                          backgroundColor: ColorTheme.salmao1,
                          //cor do ícone
                          foregroundColor: Colors.white,
                          onPressed: () {
                            pickImage();
                          }),
                    ),
                  ],
                ),
                FutureBuilder<dynamic>(
                  future: EspecieEntity().getEspecies(),
                  builder: (context, snapshot) {
                    List<dynamic> listaEspecies =
                        EspecieEntity().toList(snapshot.data);

                    print('listaEspecies: $listaEspecies');
                    return Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              setarCampoForms(nomeController, "Nome", _nome,
                                  validator: (value) => validarCampo(value)),
                              TextFormField(
                                autofocus: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Selecione uma data";
                                  }
                                  return null;
                                },
                                onSaved: (input) => _dataNascimento = input!,
                                decoration: InputDecoration(
                                  labelText: "Data de Nascimento",
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                  ),
                                ),
                                controller: dataNascimentoController,
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
                              DropdownButtonFormField(
                                hint: Text("Espécie"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Selecione a espécie";
                                  }
                                  return null;
                                },
                                onSaved: (input) =>
                                    _especie = input!.toString(),
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                items: listaEspecies.map((item) {
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
                                    especieController.text =
                                        newValue.toString();
                                    setRacas(especieController.text);
                                  });
                                },
                                value: especieId,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DropdownButtonFormField(
                                isExpanded: true,
                                hint: Text("Raça"),
                                validator: (value) {
                                  if (value == null) {
                                    return "Selecione a raça";
                                  }
                                  return null;
                                },
                                onSaved: (input) =>
                                    _especie = input!.toString(),
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                items: listaRacas.map((item) {
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
                                    racaController.text = newValue.toString();
                                  });
                                },
                                value: racaId,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedFile = image;
      });

      saveImage(image);
    }
  }

  void saveImage(XFile img) async {
    final String path = (await getApplicationDocumentsDirectory()).path;

    File convertedImg = File(img.path);

    final String fileName = Util().textToMd5(DateTime.now().toString());
    final File localImage = await convertedImg.copy('$path/$fileName');
    print("Saved Image under: $path/$fileName");
  }

  void loadImage(String imgName) async {
    final String fileName = imgName;
    final String path = (await getApplicationDocumentsDirectory()).path;

    if (File('$path/$fileName').existsSync()) {
      print("Image exists. Loading It...");
      setState(() {
        pickedFile = XFile('$path/$fileName');
      });
    }
  }
}
