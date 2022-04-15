import 'package:flutter/material.dart';

import '../themes/color_theme.dart';

class EditarVacina extends StatefulWidget {
  const EditarVacina({Key? key}) : super(key: key);

  @override
  EditarVacinaState createState() => EditarVacinaState();
}

class EditarVacinaState extends State<EditarVacina> {
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text("Salvar"),
          ),
        ],
        title: Text(
          "Editar Vacina",
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CheckboxListTile(
                  title: Text("Vacina aplicada"),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Nome da Vacina",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //formatar para receber data
                  autofocus: false,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Data da Aplicação",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //criar dropdown
                  autofocus: false,
                  // criar if para quando o checkbox não estiver selecionado, bloquear os campos lote e fabricante
                  //enabled: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Lote",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //criar dropdown
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Fabricante",
                    labelStyle: TextStyle(
                      //color: Color(0xFFCC9396),
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /* Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
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
                  ),
                   child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
