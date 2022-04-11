import 'package:flutter/material.dart';
import 'package:health_pets/class/api/token.dart';
import 'package:health_pets/pages/login.page.dart';

void setarMaterialPageRoute(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}

void setarMaterialPageRouteTab(BuildContext context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DefaultTabController(
        child: page,
        length: 4,
      ),
    ),
  );
}

void exibirMensagem(BuildContext context, mensagem) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensagem),
    ),
  );
}

setarCampoForms(variavelController, nomeCampo, variavel,
    {required FormFieldValidator<String> validator}) {
  return Column(
    children: [
      TextFormField(
        autofocus: false,
        keyboardType: TextInputType.text,
        controller: variavelController,
        validator: validator,
        onSaved: (input) => variavel = input!,
        decoration: InputDecoration(
          labelText: "$nomeCampo",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

validarCampo(value) {
  if (value!.isEmpty) {
    return "Preencha o campo";
  }
  return null;
}

void autenticacao(BuildContext context) async {
  var token = Token().getToken();

  if (token == null || token == '') {
    setarMaterialPageRoute(context, LoginPage());
  }
}
