import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Saindo...",
            ),
            SizedBox(height: 10),
            Container(
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
