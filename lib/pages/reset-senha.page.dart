import 'package:flutter/material.dart';
import 'package:health_pets/pages/login.page.dart';

class ResetSenha extends StatelessWidget {
  const ResetSenha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 220,
              height: 220,
              child: Image.asset("assets/reset-password.png"),
            ),
            Text(
              "Esqueceu sua senha?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Informe seu e-mail cadastrado, em instantes enviaremos um link com as instruções para a criação de uma nova senha.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Color(0xFFCC9396),
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFCC9396),
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
                  SnackBar(
                    action: SnackBarAction(label: 'Desfazer', onPressed: () {}),
                    content: Row(
                      children: <Widget>[
                        Icon(Icons.ac_unit_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Text("E-mail enviado com sucesso!"),
                        ),
                      ],
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  "Enviar",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
