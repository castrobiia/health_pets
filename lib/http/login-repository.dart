import 'package:health_pets/models/login-model.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'package:hive/hive.dart';

class LoginRepository {
  Future<LoginModel?> login(String email, String password) async {
    const url = 'https://www.healthpets.app.br/api/auth/login';

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    };

    var response = await http.post(Uri.parse(url), headers: header, body: {
      'email': email,
      'password': password,
    });

    var keyBox = await Hive.openBox('session');
    // if (!keyBox.containsKey('key')) {
    //   // redirecionar tela de login
    // } else {
    //   // mensagem
    // }

    print('RESPONSE STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');
  }
}
