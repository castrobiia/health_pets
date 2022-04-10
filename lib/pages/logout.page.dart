import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:health_pets/links/links-pages.dart';

import 'login.page.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

Future deleteToken(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token').toString();

  var header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ${token}"
  };

  const url = 'https://www.healthpets.app.br/api/auth/logout';
  final response = await http.get(Uri.parse(url), headers: header);

  if (response.statusCode == 200) {
    prefs.clear();
    setarMaterialPageRoute(context, LoginPage());
  }

  return Container(
    child: Text('Bye Bye'),
  );
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    deleteToken(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Saindo..."),
              SizedBox(height: 10),
              Container(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),              
    );
  }
}
