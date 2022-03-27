import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Future<String?> getPreferences(String campo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String preference = await prefs.get(campo).toString();
    return preference;
  }
}
