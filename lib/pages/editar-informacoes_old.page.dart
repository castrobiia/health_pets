// // import 'package:flutter/material.dart';
// // import 'package:health_pets/pages/tabs-perfil-pet.page.dart';
// // import 'package:health_pets/repository/informacao-repository.dart';
// // import 'package:health_pets/repository/categoria-repository.dart';
// // import 'package:health_pets/repository/subcategoria-repository.dart';
// // import 'package:health_pets/themes/color_theme.dart';
// // import 'package:health_pets/widgets/widgets.dart';
// // import 'package:intl/intl.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// //
// // class EditarInformacao extends StatefulWidget {
// //   int idAnimal;
// //   EditarInformacao(this.idAnimal);
// //
// //   @override
// //   _EditarInformacaoState createState() => _EditarInformacaoState(this.idAnimal);
// // }
// //
// // class _EditarInformacaoState extends State<EditarInformacao> {
// //   var info, _datePicker, _timePicker, conexaoCategoria;
// //   int idAnimal;
// //   bool checkedValue = false;
// //   DateTime _dataHoje = DateTime.now();
// //
// //
// //
// //   _EditarInformacaoState(this.idAnimal);
// //
// //
// //
// //   final _formKey = GlobalKey<FormState>();
// //   TextEditingController categoriaController = TextEditingController();
// //   TextEditingController subcategoriaController = TextEditingController();
// //   TextEditingController animalController = TextEditingController();
// //   TextEditingController descricaoController = TextEditingController();
// //   TextEditingController localizacaoController = TextEditingController();
// //   TextEditingController dataController = TextEditingController();
// //   TextEditingController dataSemFormatacaoController = TextEditingController();
// //   TextEditingController horaController = TextEditingController();
// //   TextEditingController valorController = TextEditingController();
// //   List listaSubcategorias = [];
// //
// //   String? _localizacao,_data,_subcategoria,_categoria,_valor,_descricao,_hora;
// //
// //
// //
// //   Future _dataSelecionada(BuildContext context) async {
// //     _datePicker = await showDatePicker(
// //         context: context,
// //         initialDate: DateTime.now(),
// //         firstDate: DateTime(DateTime.now().year - 30),
// //         lastDate: DateTime(DateTime.now().year + 5));
// //
// //     if (_datePicker != null && _datePicker != _data) {
// //       dataController.text = _datePicker.toString();
// //       dataSemFormatacaoController.text = dataController.text;
// //     } else {
// //       exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
// //     }
// //
// //     dataController.text =
// //         DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
// //   }
// //
// //   Future _horaSelecionada(BuildContext context) async {
// //     _timePicker =
// //     await showTimePicker(context: context, initialTime: TimeOfDay.now());
// //
// //     if (_timePicker != null) {
// //       setState(() {
// //         horaController.text = _timePicker.toString();
// //       });
// //     }
// //
// //     MaterialLocalizations localizations = MaterialLocalizations.of(context);
// //     horaController.text = localizations.formatTimeOfDay(_timePicker,
// //         alwaysUse24HourFormat: false);
// //   }
// //
// //   setSubcategorias(id) async {
// //     var list = await SubcategoriaRepository().getSubcategoriasPorCategoria(id);
// //     listaSubcategorias = [];
// //     // setState(() {
// //     listaSubcategorias = list;
// //     // });
// //   }
// //
// //   @override
// //   initState(){
// //     super.initState();
// //     info = InformacaoRepository().getInfo(this.idAnimal);
// //     // conexaoCategoria = CategoriaRepository().getCategorias();
// //   }
// //   Widget build(BuildContext context) {
// //     var categoriaId, subcategoriaId;
// //
// //
// //
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         centerTitle: true,
// //         title: Text(
// //           "Criar Lembrete",
// //           style: TextStyle(
// //             color: ColorTheme.salmao1,
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Container(
// //           height: MediaQuery.of(context).size.height * 1,
// //           width: double.infinity,
// //           decoration: boxDecoration(Colors.white),
// //           child: Padding(
// //             padding: EdgeInsets.only(
// //               left: 30,
// //               right: 30,
// //               top: 20,
// //             ),
// //             child: FutureBuilder<dynamic>(
// //               future: info,
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState != ConnectionState.done) {
// //
// //                   return Center(
// //                       child: Container(child: CircularProgressIndicator()));
// //                 }
// //                 if (snapshot.hasError) {
// //                   return Center(
// //                     child: Container(
// //                       child: Text(AppLocalizations.of(context)!.errorLoading),
// //                     ),
// //                   );
// //                 }
// //
// //                 var info = snapshot.data;
// //
// //                 animalController.text = info.idAnimal.toString();
// //                 descricaoController.text = info.descricao;
// //                 localizacaoController.text = info.local;
// //                 print('Data e hora ${info.data} ${info.hora}');
// //                 // dataSemFormatacaoController.text = info.data;
// //                 dataController.text = DateFormat("dd/MM/yyyy").format(DateTime.parse(info.data.toString()));
// //                 horaController.text = info.hora;
// //                 valorController.text = info.valor.toString();
// //
// //                 return Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     children: <Widget>[
// //                       FutureBuilder<dynamic>(
// //                           future: CategoriaRepository().getCategorias(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState !=
// //                                 ConnectionState.done) {
// //                               return Center(
// //                                   child: Container(child: CircularProgressIndicator()));
// //                             }
// //                             if (snapshot.hasError) {
// //                               return Center(
// //                                 child: Container(
// //                                   child: Text(
// //                                       AppLocalizations.of(context)!.errorLoading),
// //                                 ),
// //                               );
// //                             }
// //
// //                             List<dynamic> listaCategorias =
// //                             CategoriaRepository().toListCategoria(snapshot.data);
// //
// //                             return Column(
// //                               children: [
// //                                 DropdownButtonFormField(
// //                                   hint: Text(AppLocalizations.of(context)!.category),
// //                                   validator: (value) {
// //                                     if (value == null) {
// //                                       return AppLocalizations.of(context)!.selectCategory;
// //                                     }
// //                                     return null;
// //                                   },
// //                                   onSaved: (input) => _categoria = input!.toString(),
// //                                   style: TextStyle(fontSize: 17, color: Colors.black),
// //                                   items: listaCategorias.map((item) {
// //                                     return DropdownMenuItem(
// //                                       child: new Text(
// //                                         item.nome,
// //                                         style: TextStyle(fontSize: 17),
// //                                       ),
// //                                       value: item.id,
// //                                     );
// //                                   }).toList(),
// //                                   onChanged: (newValue) {
// //                                     // setState(() {
// //                                     categoriaController.text = newValue.toString();
// //                                     // listaSubcategorias = [];
// //                                     setSubcategorias(categoriaController.text);
// //                                     // });
// //                                   },
// //                                   value: info.idCategoria,
// //                                 ),
// //                                 SizedBox(
// //                                   height: 10,
// //                                 ),
// //                                 FutureBuilder<dynamic>(
// //                                     future: SubcategoriaRepository().getSubcategoriasPorCategoria(info.idCategoria.toString()),
// //                                     builder: (context, snapshot) {
// //                                       if (snapshot.connectionState !=
// //                                           ConnectionState.done) {
// //                                         return Center(
// //                                             child: Container(child: CircularProgressIndicator()));
// //                                       }
// //                                       if (snapshot.hasError) {
// //                                         return Center(
// //                                           child: Container(
// //                                             child: Text(
// //                                                 AppLocalizations.of(context)!.errorLoading),
// //                                           ),
// //                                         );
// //                                       }
// //
// //                                       var listaSub = SubcategoriaRepository().toListSubcategoria(snapshot.data);
// //
// //                                       return DropdownButtonFormField(
// //                                         isExpanded: true,
// //                                         hint: Text(AppLocalizations.of(context)!.subcategory),
// //                                         validator: (value) {
// //                                           if (value == null) {
// //                                             return AppLocalizations.of(context)!.selectBreed;
// //                                           }
// //                                           return null;
// //                                         },
// //                                         onSaved: (input) => _subcategoria = input!.toString(),
// //                                         style: TextStyle(fontSize: 17, color: Colors.black),
// //                                         items: listaSub.map((item) {
// //                                           return DropdownMenuItem(
// //                                             child: new Text(
// //                                               item.nome!,
// //                                               style: TextStyle(fontSize: 17),
// //                                             ),
// //                                             value: item.id!,
// //                                           );
// //                                         }).toList(),
// //                                         onChanged: (newValue) {
// //                                           // setState(() {
// //                                           subcategoriaController.text = newValue.toString();
// //                                           // });
// //                                         },
// //                                         value:  info.idSubcategoria,
// //                                       );
// //                                     }),
// //                                 //
// //                                 SizedBox(
// //                                   height: 10,
// //                                 ),
// //                                 Row(children: [
// //                                   Expanded(
// //                                     child: TextFormField(
// //                                       autofocus: false,
// //                                       keyboardType: TextInputType.text,
// //                                       controller: dataController,
// //                                       validator: (value) {
// //                                         if (value!.isEmpty) {
// //                                           return AppLocalizations.of(context)!.selectDate;
// //                                         }
// //                                         return null;
// //                                       },
// //                                       onSaved: (input) => _data = input!,
// //                                       decoration: InputDecoration(
// //                                         labelText: AppLocalizations.of(context)!.date,
// //                                         labelStyle: TextStyle(
// //                                           fontWeight: FontWeight.w400,
// //                                           fontSize: 17,
// //                                         ),
// //                                       ),
// //                                       readOnly: true,
// //                                       onTap: () {
// //                                         // setState(
// //                                         // () {
// //                                         _dataSelecionada(context);
// //                                         // },
// //                                         // );
// //                                       },
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     width: 20,
// //                                   ),
// //                                   Expanded(
// //                                     child: TextFormField(
// //                                       autofocus: false,
// //                                       keyboardType: TextInputType.text,
// //                                       controller: horaController,
// //                                       onSaved: (input) => _hora = input!,
// //                                       decoration: InputDecoration(
// //                                         labelText: AppLocalizations.of(context)!.hour,
// //                                         labelStyle: TextStyle(
// //                                           fontWeight: FontWeight.w400,
// //                                           fontSize: 17,
// //                                         ),
// //                                       ),
// //                                       readOnly: true,
// //                                       onTap: () {
// //                                         // setState(
// //                                         //       () {
// //                                         _horaSelecionada(context);
// //                                         // },
// //                                         // );
// //                                       },
// //                                     ),
// //                                   )
// //                                 ]),
// //                                 SizedBox(
// //                                   height: 10,
// //                                 ),
// //                               ],
// //                             );
// //                           }),
// //                       //text
// //                       TextFormField(
// //                         autofocus: false,
// //                         keyboardType: TextInputType.text,
// //                         controller: localizacaoController,
// //                         validator: (value) => validarCampo(value),
// //                         onSaved: (input) => _localizacao = input!,
// //                         decoration: InputDecoration(
// //                           labelText: "Nome",
// //                           labelStyle: TextStyle(
// //                             fontWeight: FontWeight.w400,
// //                             fontSize: 17,
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       TextFormField(
// //                         autofocus: false,
// //                         keyboardType: TextInputType.number,
// //                         controller: valorController,
// //                         //validator: (value) => validarCampo(value),
// //                         onSaved: (input) => _valor = input!,
// //                         decoration: InputDecoration(
// //                           labelText: AppLocalizations.of(context)!.price,
// //                           labelStyle: TextStyle(
// //                             fontWeight: FontWeight.w400,
// //                             fontSize: 17,
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       TextFormField(
// //                         autofocus: false,
// //                         keyboardType: TextInputType.text,
// //                         controller: descricaoController,
// //                         maxLines: 3,
// //                         maxLength: 150,
// //                         validator: (value) => validarCampo(value),
// //                         onSaved: (input) => _descricao = input!,
// //                         decoration: InputDecoration(
// //                           labelText: AppLocalizations.of(context)!.description,
// //                           labelStyle: TextStyle(
// //                             fontWeight: FontWeight.w400,
// //                             fontSize: 17,
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       CheckboxListTile(
// //                         title: Text(AppLocalizations.of(context)!.addAlert),
// //                         value: checkedValue,
// //                         onChanged: (newValue) {},
// //                         //   setState(() {
// //                         //     checkedValue = newValue!;
// //                         //   });
// //                         // },
// //                         controlAffinity: ListTileControlAffinity
// //                             .leading, //  <-- leading Checkbox
// //                       ),
// //                       SizedBox(
// //                         height: 30,
// //                       ),
// //                       Container(
// //                         width: double.infinity,
// //                         decoration: botaoRetangulo(),
// //                         child: TextButton(
// //                           onPressed: () async {
// //                             if (_formKey.currentState!.validate()) {
// //                               _formKey.currentState!.save();
// //                               var id_categoria = categoriaController.text;
// //                               var id_subcategoria = subcategoriaController.text;
// //                               var id_animal = this.idAnimal;
// //                               String data = dataSemFormatacaoController.text;
// //                               String local = localizacaoController.text;
// //                               var valor = valorController.text;
// //                               String descricao = descricaoController.text;
// //                               bool lembrete = checkedValue;
// //                               var hora;
// //
// //                               var dataSemFormatacao =
// //                                   dataSemFormatacaoController.text;
// //
// //                               if (dataSemFormatacao.isEmpty) {
// //                                 data = info.data;
// //                               } else {
// //                                 data = dataSemFormatacaoController.text;
// //                               }
// //
// //                               if (lembrete == true &&
// //                                   horaController.text != null) {
// //                                 hora = horaController.text;
// //                               }
// //                               if (lembrete == true &&
// //                                   horaController.text.isEmpty) {
// //                                 hora = '00:00';
// //                               } else if (lembrete == false) {
// //                                 hora = '00:00';
// //                               }
// //
// //                               print(id_categoria);
// //                               print(id_subcategoria);
// //                               print(data);
// //                               print(local);
// //                               print(valor);
// //                               print(descricao);
// //                               print(lembrete);
// //                               print(id_animal);
// //                               print(hora);
// //
// //                               if (await InformacaoRepository().postInformacao(
// //                                   data,
// //                                   descricao,
// //                                   id_categoria,
// //                                   id_subcategoria,
// //                                   local,
// //                                   valor,
// //                                   hora,
// //                                   lembrete.toString(),
// //                                   id_animal.toString()) ==
// //                                   200) {
// //                                 exibirMensagem(context,
// //                                     'Informações cadastradas com sucesso');
// //                                 setarMaterialPageRoute(
// //                                     context, PerfilPetPage(idAnimal));
// //                               } else {
// //                                 exibirMensagem(context,
// //                                     'Não foi possível cadastrar informações');
// //                               }
// //                             }
// //                           },
// //                           child: textBotao(AppLocalizations.of(context)!.save),
// //                         ),
// //                       ),
// //                     ],
// //                     // children: <Widget>[
// //                     //
// //                     // ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:health_pets/pages/tabs-perfil-pet.page.dart';
// import 'package:health_pets/repository/informacao-repository.dart';
// import 'package:health_pets/repository/categoria-repository.dart';
// import 'package:health_pets/repository/subcategoria-repository.dart';
// import 'package:health_pets/themes/color_theme.dart';
// import 'package:health_pets/widgets/widgets.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//
// class EditarInformacao extends StatefulWidget {
//   int idAnimal;
//   EditarInformacao(this.idAnimal);
//
//   @override
//   _EditarInformacaoState createState() => _EditarInformacaoState(this.idAnimal);
// }
//
// class _EditarInformacaoState extends State<EditarInformacao> {
//   var info, _datePicker, _timePicker, conexaoCategoria;
//   int idAnimal;
//   bool checkedValue = false;
//   DateTime _dataHoje = DateTime.now();
//
//
//
//   _EditarInformacaoState(this.idAnimal);
//
//
//
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController categoriaController = TextEditingController();
//   TextEditingController subcategoriaController = TextEditingController();
//   TextEditingController animalController = TextEditingController();
//   TextEditingController descricaoController = TextEditingController();
//   TextEditingController localizacaoController = TextEditingController();
//   TextEditingController dataController = TextEditingController();
//   TextEditingController dataSemFormatacaoController = TextEditingController();
//   TextEditingController horaController = TextEditingController();
//   TextEditingController valorController = TextEditingController();
//   List listaSubcategorias = [];
//
//   String? _localizacao,_data,_subcategoria,_categoria,_valor,_descricao,_hora;
//
//
//
//   Future _dataSelecionada(BuildContext context) async {
//     _datePicker = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(DateTime.now().year - 30),
//         lastDate: DateTime(DateTime.now().year + 5));
//
//     if (_datePicker != null && _datePicker != _data) {
//       dataController.text = _datePicker.toString();
//       dataSemFormatacaoController.text = dataController.text;
//     } else {
//       exibirMensagem(context, AppLocalizations.of(context)!.selectDate);
//     }
//
//     dataController.text =
//         DateFormat("dd/MM/yyyy").format(DateTime.parse(_datePicker.toString()));
//   }
//
//   Future _horaSelecionada(BuildContext context) async {
//     _timePicker =
//     await showTimePicker(context: context, initialTime: TimeOfDay.now());
//
//     if (_timePicker != null) {
//       setState(() {
//         horaController.text = _timePicker.toString();
//       });
//     }
//
//     MaterialLocalizations localizations = MaterialLocalizations.of(context);
//     horaController.text = localizations.formatTimeOfDay(_timePicker,
//         alwaysUse24HourFormat: false);
//   }
//
//   setSubcategorias(id) async {
//     var list = await SubcategoriaRepository().getSubcategoriasPorCategoria(id);
//     listaSubcategorias = [];
//     // setState(() {
//     listaSubcategorias = list;
//     // });
//   }
//
//   @override
//   initState(){
//     super.initState();
//     info = InformacaoRepository().getInfo(this.idAnimal);
//     // conexaoCategoria = CategoriaRepository().getCategorias();
//   }
//   Widget build(BuildContext context) {
//     var categoriaId, subcategoriaId;
//
//
//
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         title: Text(
//           "Criar Lembrete",
//           style: TextStyle(
//             color: ColorTheme.salmao1,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 1,
//           width: double.infinity,
//           decoration: boxDecoration(Colors.white),
//           child: Padding(
//             padding: EdgeInsets.only(
//               left: 30,
//               right: 30,
//               top: 20,
//             ),
//             child: FutureBuilder<dynamic>(
//               future: info,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState != ConnectionState.done) {
//
//                   return Center(
//                       child: Container(child: CircularProgressIndicator()));
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                     child: Container(
//                       child: Text(AppLocalizations.of(context)!.errorLoading),
//                     ),
//                   );
//                 }
//
//                 var info = snapshot.data;
//
//                 animalController.text = info.idAnimal.toString();
//                 descricaoController.text = info.descricao;
//                 localizacaoController.text = info.local;
//                 print('Data e hora ${info.data} ${info.hora}');
//                 // dataSemFormatacaoController.text = info.data;
//                 dataController.text = DateFormat("dd/MM/yyyy").format(DateTime.parse(info.data.toString()));
//                 horaController.text = info.hora;
//                 valorController.text = info.valor.toString();
//
//                 return Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       FutureBuilder<dynamic>(
//                           future: CategoriaRepository().getCategorias(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Center(
//                                   child: Container(child: CircularProgressIndicator()));
//                             }
//                             if (snapshot.hasError) {
//                               return Center(
//                                 child: Container(
//                                   child: Text(
//                                       AppLocalizations.of(context)!.errorLoading),
//                                 ),
//                               );
//                             }
//
//                             List<dynamic> listaCategorias =
//                             CategoriaRepository().toListCategoria(snapshot.data);
//
//                             return DropdownButtonFormField(
//                               hint: Text(AppLocalizations.of(context)!.category),
//                               validator: (value) {
//                                 if (value == null) {
//                                   return AppLocalizations.of(context)!.selectCategory;
//                                 }
//                                 return null;
//                               },
//                               onSaved: (input) => _categoria = input!.toString(),
//                               style: TextStyle(fontSize: 17, color: Colors.black),
//                               items: listaCategorias.map((item) {
//                                 return DropdownMenuItem(
//                                   child: new Text(
//                                     item.nome,
//                                     style: TextStyle(fontSize: 17),
//                                   ),
//                                   value: item.id,
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 // setState(() {
//                                 categoriaController.text = newValue.toString();
//                                 // listaSubcategorias = [];
//                                 setSubcategorias(categoriaController.text);
//                                 // });
//                               },
//                               value: info.idCategoria,
//                             );}
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       FutureBuilder<dynamic>(
//                           future: SubcategoriaRepository().getSubcategoriasPorCategoria(info.idCategoria.toString()),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState !=
//                                 ConnectionState.done) {
//                               return Center(
//                                   child: Container(child: CircularProgressIndicator()));
//                             }
//                             if (snapshot.hasError) {
//                               return Center(
//                                 child: Container(
//                                   child: Text(
//                                       AppLocalizations.of(context)!.errorLoading),
//                                 ),
//                               );
//                             }
//
//                             var listaSub = SubcategoriaRepository().toListSubcategoria(snapshot.data);
//
//                             return DropdownButtonFormField(
//                               isExpanded: true,
//                               hint: Text(AppLocalizations.of(context)!.subcategory),
//                               validator: (value) {
//                                 if (value == null) {
//                                   return AppLocalizations.of(context)!.selectBreed;
//                                 }
//                                 return null;
//                               },
//                               onSaved: (input) => _subcategoria = input!.toString(),
//                               style: TextStyle(fontSize: 17, color: Colors.black),
//                               items: listaSub.map((item) {
//                                 return DropdownMenuItem(
//                                   child: new Text(
//                                     item.nome!,
//                                     style: TextStyle(fontSize: 17),
//                                   ),
//                                   value: item.id!,
//                                 );
//                               }).toList(),
//                               onChanged: (newValue) {
//                                 // setState(() {
//                                 subcategoriaController.text = newValue.toString();
//                                 // });
//                               },
//                               value: info.idSubcategoria,
//                             );
//                           }),
//                       //
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                           children: [
//                             Expanded(
//                               child: TextFormField(
//                                 autofocus: false,
//                                 keyboardType: TextInputType.text,
//                                 controller: dataController,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return AppLocalizations.of(context)!.selectDate;
//                                   }
//                                   return null;
//                                 },
//                                 onSaved: (input) => _data = input!,
//                                 decoration: InputDecoration(
//                                   labelText: AppLocalizations.of(context)!.date,
//                                   labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 readOnly: true,
//                                 onTap: () {
//                                   // setState(
//                                   // () {
//                                   _dataSelecionada(context);
//                                   // },
//                                   // );
//                                 },
//                               ) ,
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                               child: TextFormField(
//                                 autofocus: false,
//                                 keyboardType: TextInputType.text,
//                                 controller: horaController,
//                                 onSaved: (input) => _hora = input!,
//                                 decoration: InputDecoration(
//                                   labelText: AppLocalizations.of(context)!.hour,
//                                   labelStyle: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 17,
//                                   ),
//                                 ),
//                                 readOnly: true,
//                                 onTap: () {
//                                   // setState(
//                                   //       () {
//                                   _horaSelecionada(context);
//                                   // },
//                                   // );
//                                 },
//                               ),
//                             )
//                           ]
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       // ],
//                       // )
//                       // }),
//                       //text
//                       TextFormField(
//                         autofocus: false,
//                         keyboardType: TextInputType.text,
//                         controller: localizacaoController,
//                         validator: (value) => validarCampo(value),
//                         onSaved: (input) => _localizacao = input!,
//                         decoration: InputDecoration(
//                           labelText: "Nome",
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         autofocus: false,
//                         keyboardType: TextInputType.number,
//                         controller: valorController,
//                         //validator: (value) => validarCampo(value),
//                         onSaved: (input) => _valor = input!,
//                         decoration: InputDecoration(
//                           labelText: AppLocalizations.of(context)!.price,
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         autofocus: false,
//                         keyboardType: TextInputType.text,
//                         controller: descricaoController,
//                         maxLines: 3,
//                         maxLength: 150,
//                         validator: (value) => validarCampo(value),
//                         onSaved: (input) => _descricao = input!,
//                         decoration: InputDecoration(
//                           labelText: AppLocalizations.of(context)!.description,
//                           labelStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       CheckboxListTile(
//                         title: Text(AppLocalizations.of(context)!.addAlert),
//                         value: checkedValue,
//                         onChanged: (newValue) {},
//                         //   setState(() {
//                         //     checkedValue = newValue!;
//                         //   });
//                         // },
//                         controlAffinity: ListTileControlAffinity
//                             .leading, //  <-- leading Checkbox
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Container(
//                         width: double.infinity,
//                         decoration: botaoRetangulo(),
//                         child: TextButton(
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               _formKey.currentState!.save();
//                               var id_categoria = categoriaController.text;
//                               var id_subcategoria = subcategoriaController.text;
//                               var id_animal = this.idAnimal;
//                               String data = dataSemFormatacaoController.text;
//                               String local = localizacaoController.text;
//                               var valor = valorController.text;
//                               String descricao = descricaoController.text;
//                               bool lembrete = checkedValue;
//                               var hora;
//
//                               var dataSemFormatacao =
//                                   dataSemFormatacaoController.text;
//
//                               if (dataSemFormatacao.isEmpty) {
//                                 data = info.data;
//                               } else {
//                                 data = dataSemFormatacaoController.text;
//                               }
//
//                               if (lembrete == true &&
//                                   horaController.text != null) {
//                                 hora = horaController.text;
//                               }
//                               if (lembrete == true &&
//                                   horaController.text.isEmpty) {
//                                 hora = '00:00';
//                               } else if (lembrete == false) {
//                                 hora = '00:00';
//                               }
//
//                               print(id_categoria);
//                               print(id_subcategoria);
//                               print(data);
//                               print(local);
//                               print(valor);
//                               print(descricao);
//                               print(lembrete);
//                               print(id_animal);
//                               print(hora);
//
//                               if (await InformacaoRepository().postInformacao(
//                                   data,
//                                   descricao,
//                                   id_categoria,
//                                   id_subcategoria,
//                                   local,
//                                   valor,
//                                   hora,
//                                   lembrete.toString(),
//                                   id_animal.toString()) ==
//                                   200) {
//                                 exibirMensagem(context,
//                                     'Informações cadastradas com sucesso');
//                                 setarMaterialPageRoute(
//                                     context, PerfilPetPage(idAnimal));
//                               } else {
//                                 exibirMensagem(context,
//                                     'Não foi possível cadastrar informações');
//                               }
//                             }
//                           },
//                           child: textBotao(AppLocalizations.of(context)!.save),
//                         ),
//                       ),
//                     ],
//                     // children: <Widget>[
//                     //
//                     // ],
//                   ),
//                 );
//               },),
//           ),
//         ),
//       ),
//     );
//
//   }
// }