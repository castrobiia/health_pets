import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../class/entity/especie-entity.dart';
import '../class/entity/raca-entity.dart';
import '../class/util.dart';
import '../http/animal-repository.dart';
import '../models/cadastro-animal-model.dart';
import '../widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditarPetPage extends StatefulWidget {
  final id;
  const EditarPetPage(this.id);

  @override
  State<EditarPetPage> createState() => _EditarPetPageState(this.id);
}

class _EditarPetPageState extends State<EditarPetPage> {
  final id;
  _EditarPetPageState(this.id);

  DateTime _data = DateTime.now();
  final ImagePicker _picker = ImagePicker();
  var animal;
  XFile? pickedFile;

  catchAnimal(id) async {
    this.animal = await AnimalRepository().getAnimal(id);
    return this.animal;
  }

  Future _dataSelecionada(BuildContext context) async {
    var _datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 30),
        lastDate: DateTime.now());

    if (_datePicker != null && _datePicker != _data) {
      dataNascimentoController.text = _datePicker.toString();
      dataNascimentoTesteController.text = dataNascimentoController.text;
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
    var list = await RacaEntity().getRacasPorEspecie(id.toString());
    listaRacas = list;
  }

  @override
  Widget build(BuildContext context) {
    // var ;
    var nome, data_nascimento, especieId, racaId;

    // print(this.id);

    catchAnimal(this.id);

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

                // print("Picked file path: ${pickedFile?.path }");
                // print("Foto: $foto");

                if (await AnimalRepository().postAnimal(
                        nome, data_nascimento, id_especie, id_raca, foto) ==
                    '200') {}

                setarMaterialPageRoute(context, TabsPage());
              }
            },
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
        title: Text(
          AppLocalizations.of(context)!.editPet,
          style: TextStyle(
            color: ColorTheme.salmao1,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: catchAnimal(this.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: Container(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return Center(
              child: Container(
                child: Text(AppLocalizations.of(context)!.errorLoading),
              ),
            );
          }

          this.animal = snapshot.data;
          nomeController.text = animal.nome;
          dataNascimentoController.text = animal.dataNascimento;
          print(animal.foto);

          return Container(
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
                      Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(top: 15, left: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: animal.foto == '' || animal.foto == null ?Image.network("https://healthpets.app.br/storage/pets/default.png").image : Image.network("https://healthpets.app.br/storage/pets/${animal.foto}").image
                          ),
                        ),
                      ),
                      Positioned(
                        top: 160,
                        left: 150,
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
                      List<dynamic> listaEspecies = EspecieEntity().toList(snapshot.data);

                      return Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  controller: nomeController,
                                  validator: (value) => validarCampo(value),
                                  onSaved: (input) => nome = input!,
                                  decoration: InputDecoration(
                                    labelText: "Nome",
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
                                    _dataSelecionada(context);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  //Especie
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: DropdownButtonFormField(
                                      value: animal.idEspecie,
                                      hint: Text(AppLocalizations.of(context)!
                                          .species),
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
                                      onSaved: (newValue) {
                                        especieId = newValue.toString();
                                      },
                                      onChanged: (newValue) {
                                        especieId = newValue.toString();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  FutureBuilder<dynamic>(
                    future: RacaEntity().getRacasPorEspecie(animal.idEspecie.toString()),
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
                      List<dynamic> listaRacas = RacaEntity().toList(snapshot.data);

                      return Column(
                        children: <Widget>[
                          Container(
                            //Raça
                            width: double.infinity,
                            child: SizedBox(
                              width: double.infinity,
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                value: animal.idRaca,
                                hint: Text(AppLocalizations.of(context)!.breed),
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
                                onSaved: (newValue) {
                                  racaId = newValue.toString();
                                },
                                onChanged: (newValue) {
                                  racaId = newValue.toString();
                                },
                              ),
                            ),
                          ),
                        ],
                      );

                    },
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
                          //salvar o estado do formulário
                          _formKey.currentState!.save();


                          // String? nome, data_nascimento, raca, foto;
                          var foto;

                          if (nomeController.text.isEmpty != true)
                            animal.nome = nomeController.text;


                          if (dataNascimentoTesteController.text.isEmpty != true)
                            animal.dataNascimento = dataNascimentoTesteController.text;

                          if (especieController.text.isEmpty != true)
                            animal.idEspecie = especieController.text;
                          if (racaController.text.isEmpty != true)
                            animal.idRaca.toString();
                          if (pickedFile?.path == null ||
                              pickedFile?.path == '') {
                            animal.foto = 'default.png';
                          }

                          var code =  await AnimalRepository().putAnimal(animal.nome, animal.dataNascimento, animal.idEspecie.toString(),
                              animal.idRaca.toString(), animal.foto, id, context);
                        }
                      },
                      child: textBotao(AppLocalizations.of(context)!.save),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      )),
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
