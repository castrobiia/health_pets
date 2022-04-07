import 'package:health_pets/class/api/token.dart';

class Header {
  Map<String, String>? getHeader() {
    var token = Token().getToken();
    var headerToken = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    return headerToken;
  }
}
