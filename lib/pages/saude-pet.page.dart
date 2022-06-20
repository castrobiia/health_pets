import 'package:flutter/material.dart';
import 'package:health_pets/pages/diario-pet.page.dart';
import 'package:health_pets/pages/informacao-geral.page.dart';
import 'package:health_pets/repository/informacao-repository.dart';
import 'package:health_pets/repository/diario-repository.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SaudePet extends StatefulWidget {
  //const SaudePet({Key? key}) : super(key: key);

  SaudePet(this.dia, this.peso, this.id);

  final String dia;
  final double peso;
  final int id;

  @override
  _SaudePetState createState() => _SaudePetState(id);
}

class _SaudePetState extends State<SaudePet> {
  final int id;

  _SaudePetState(this.id);

  @override
  var conexaoDiario, conexaoInfoSaude;
  initState() {
    setState(() {
      conexaoDiario = DiarioRepository().getDiarios(id);
      conexaoInfoSaude = InformacaoRepository().getInfosGeral(id);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: conexaoDiario,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Container(
                child: erroCarregarDados(context),
              ),
            );
          }

          final listDiario = snapshot.data ?? [];
          return FutureBuilder<dynamic>(
            future: conexaoInfoSaude,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Container(
                    child: erroCarregarDados(context),
                  ),
                );
              }

              final listaInfosGeral = snapshot.data ?? [];

              int tamanhoLista = listaInfosGeral.length;

              int qntdeExame = 0;
              int qtndeConsulta = 0;
              int qntdeProcedimento = 0;
              int qntdeMedicamento = 0;
              int qntdeVacina = 0;

              for (var i = 0; i < tamanhoLista; i++) {
                if (listaInfosGeral[i]['id_subcategoria'] == 85) {
                  qntdeExame++;
                }
                if (listaInfosGeral[i]['id_subcategoria'] == 84) {
                  qtndeConsulta++;
                }
                if (listaInfosGeral[i]['id_subcategoria'] == 86) {
                  qntdeMedicamento++;
                }
                if (listaInfosGeral[i]['id_subcategoria'] == 87) {
                  qntdeProcedimento++;
                }
                if (listaInfosGeral[i]['id_subcategoria'] == 88) {
                  qntdeVacina++;
                }
              }

              print('qntdeExame: $qntdeExame');
              print('qtndeConsulta: $qtndeConsulta');
              print('qntdeProcedimento: $qntdeProcedimento');
              print('qntdeMedicamento: $qntdeMedicamento');
              print('qntdeVacina: $qntdeVacina');

              return Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      width: double.infinity,
                      height: 500,
                      decoration: boxDecoration(Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              iconesHistorico(
                                context,
                                InformacaoPage(id, 84),
                                Image.asset("assets/consultation.png"),
                                AppLocalizations.of(context)!.consultations,
                                qtndeConsulta.toString(),
                              ),
                              iconesHistorico(
                                context,
                                DiarioPet(id),
                                Image.asset("assets/diario.png"),
                                AppLocalizations.of(context)!.diary,
                                listDiario.length.toString(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              iconesHistorico(
                                context,
                                InformacaoPage(id, 85),
                                Image.asset("assets/microscope.png"),
                                AppLocalizations.of(context)!.exams,
                                qntdeExame.toString(),
                              ),
                              iconesHistorico(
                                context,
                                InformacaoPage(id, 86),
                                Image.asset("assets/medicine.png"),
                                AppLocalizations.of(context)!.medicines,
                                qntdeMedicamento.toString(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              iconesHistorico(
                                context,
                                InformacaoPage(id, 87),
                                Image.asset("assets/surgery.png"),
                                AppLocalizations.of(context)!.procedures,
                                qntdeProcedimento.toString(),
                              ),
                              iconesHistorico(
                                context,
                                InformacaoPage(id, 88),
                                Image.asset("assets/injection.png"),
                                AppLocalizations.of(context)!.vaccines,
                                qntdeVacina.toString(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
