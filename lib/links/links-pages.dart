import 'package:flutter/material.dart';

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

setarCampoDataForms(BuildContext context, variavelController, nomeCampo, variavel,
    {required FormFieldValidator<String> validator}) {
  return Column(
    children: [
      TextFormField(
        autofocus: false,
        validator: (value) {
          if (value!.isEmpty) {
            return "Selecione uma data";
          }
          return null;
        },
        onSaved: (input) => variavel = input!,
        decoration: InputDecoration(
          labelText: "$nomeCampo",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
        controller: variavelController,
        readOnly: true,
        onTap: () {
          setState(
            () {
              variavel(context);
            },
          );
        },
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
