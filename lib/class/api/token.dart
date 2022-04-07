import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    return token;
  }
}
