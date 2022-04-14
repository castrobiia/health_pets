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

setarRowPerfil(campo, texto) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            campo,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(texto),
        ],
      ),
    ],
  );
}

divider() {
  return Divider(
    height: 1,
    thickness: 1,
  );
}

boxDecoration(cor) {
  return BoxDecoration(
    color: cor,
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    boxShadow: [decorationBoxShadow()],
  );
}

BoxDecorationImagem(double tamanho, imagem) {
  return Container(
    width: tamanho,
    height: tamanho,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(imagem),
      ),
    ),
  );
}

decorationBoxShadow() {
  return new BoxShadow(
    //cor do fundo (em volta) do container
    color: Colors.black12,
    //qnt de sombra
    offset: new Offset(1, 2.0),
    //expansao da sombra
    blurRadius: 5,
    //intensidade da borda
    spreadRadius: 1,
  );
}

textBotao(texto) {
  return Text(
    texto,
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 17),
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