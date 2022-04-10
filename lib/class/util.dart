import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Future<String?> getPreferences(String campo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String preference = await prefs.get(campo).toString();
    return preference;
  }

  String calculoIdade(hoje, nascimento) {
    var anos = calculoAnos(hoje, nascimento);
    var meses = calculoMeses(hoje, nascimento);

    if (anos > 0) {
      if (anos == 1) {
        return anos.toString() + ' ano e ' + meses.toString();
      } else {
        return anos.toString() + ' anos e ' + meses.toString();
      }
    } else {
      return meses.toString();
    }
  }

  calculoAnos(hoje, nascimento) {
    var numAnos = hoje.year - nascimento.year;
    if (hoje.month < nascimento.month ||
        (hoje.month == nascimento.month && hoje.day < nascimento.day)) {
      numAnos--;
    }
    return numAnos;
  }

  String calculoMeses(hoje, nascimento) {
    num numMeses = 0;
    if (hoje.month > nascimento.month) {
      numMeses = hoje.month - nascimento.month;
    } else if (hoje.month < nascimento.month) {
      if (hoje.day > nascimento.day) {
        numMeses = (12 - nascimento.month) + (hoje.month);
      } else if (hoje.day < nascimento.day) {
        numMeses = (12 - nascimento.month) + (hoje.month - 1);
      }
    }
    if (numMeses == 1) {
      return numMeses.toString() + ' mês';
    } else {
      return numMeses.toString() + ' meses';
    }
  }
}
