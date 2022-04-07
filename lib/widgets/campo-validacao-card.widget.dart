import 'package:flutter/material.dart';

class ValidacaoCampoCard extends StatelessWidget {
  const ValidacaoCampoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return "Preencha o lote";
        }
        return null;
      },
      onSaved: (input) => _lote = input!,
      controller: VacinaController().loteController,
      decoration: InputDecoration(
        labelText: "Lote",
        labelStyle: TextStyle(
          //color: Color(0xFFCC9396),
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
      ),
    );
  }
}
