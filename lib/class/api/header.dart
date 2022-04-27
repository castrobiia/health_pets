import 'package:health_pets/class/api/token.dart';
import 'package:health_pets/settings.dart';

class Header {
  Map<String, String>? getHeader() {
    var token = Token().getToken();
    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${Settings.user.token}"
    };

    return headerToken;
  }
}
