import 'package:health_pets/models/login-model.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

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

    print('RESPONSE STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');
  }
}
