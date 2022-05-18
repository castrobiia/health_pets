import 'package:flutter/material.dart';
import 'package:health_pets/class/api/token.dart';
import 'package:health_pets/themes/color_theme.dart';

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

botaoRetangulo() {
  return BoxDecoration(
    color: ColorTheme.salmao1,
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
    boxShadow: [
      new BoxShadow(
        //cor do fundo (em volta) do container
        color: Colors.black12,
        //qnt de sombra
        offset: new Offset(1, 2.0),
        //expansao da sombra
        blurRadius: 5,
        //intensidade da borda
        spreadRadius: 3,
      ),
    ],
  );
}

//Substituido pelo botao embaixo (botaoRetangulo + textBotao)
botaoSalvarAppBar() {
  return Text(
    "Salvar",
    style: TextStyle(
      color: ColorTheme.salmao1,
      fontWeight: FontWeight.bold,
    ),
  );
}

validarCampo(value) {
  if (value!.isEmpty) {
    return "Preencha o campo";
  }
  return null;
}

autenticacao(BuildContext context) async {
  var token = await Token().getToken().then((token) => token ?? 0);
  if (token.toString().compareTo("null") == 0) {
    Navigator.pushNamed(context, '/login');
  }
}

erroCarregarDados(BuildContext context) {
  return Text(
    'Erro ao carregar os dados',
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w300,
    ),
  );
}

iconesHistorico(context, page, image_icon, titulo, qnt_cadastrado) {
  return GestureDetector(
    onTap: () {
      setarMaterialPageRoute(context, page);
    }, // Image tapped
    child: Container(
      width: 100,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 50,
            height: 50,
            child: image_icon,
          ),
          SizedBox(
            height: 5,
          ),
          Text(titulo),
          SizedBox(
            height: 10,
          ),
          Text(
            qnt_cadastrado,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
