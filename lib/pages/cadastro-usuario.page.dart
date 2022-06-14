import 'package:flutter/material.dart';
import 'package:health_pets/pages/tabs.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CadastroUsuario extends StatelessWidget {
  const CadastroUsuario({Key? key}) : super(key: key);

  createInfoDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.passwordInformation),
            content: Text("Teste 2"),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Criar Conta",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: ColorTheme.salmao1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    //validator:
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        color: ColorTheme.rosa5,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: ColorTheme.rosa5,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                    //controller: nomeController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          createInfoDialog(context);
                        },
                        icon: Icon(Icons.info),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: ColorTheme.rosa5,
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
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirmar Senha",
                      labelStyle: TextStyle(
                          color: ColorTheme.rosa5,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      "Ao continuar, estou de acordo com as Termos de Uso e Políticas de Privacidade do Health Pets.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: boxDecoration(ColorTheme.rosa5),
                    child: TextButton(
                      onPressed: () {
                        setarMaterialPageRouteTab(context, TabsPage());
                      },
                      child: textBotao("Salvar"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
