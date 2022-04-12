import 'package:intl/intl.dart';
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
    var dias = calculoDias(hoje, nascimento);

    if (anos > 0) {
      if (anos == 1) {
        return anos.toString() + ' ano';
      } else {
        return anos.toString() + ' anos';
      }
    } else if (meses > 0) {
      if (meses == 1) {
        return meses.toString() + ' mês';
      } else {
        return meses.toString() + ' meses';
      }
    } else if (dias == 1) {
      return dias.toString() + ' dia';
    } else {
      return dias.toString() + ' dias';
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

  calculoMeses(hoje, nascimento) {
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
    return numMeses;
  }

  int calculoDias(hoje, nascimento) {
    var numDias = 0;
    var dUltima;
    if ((hoje.month > nascimento.month || hoje.month < nascimento.month) &&
        (hoje.day > nascimento.day)) {
      dUltima = DateTime(hoje.year, hoje.month, nascimento.day);
      numDias = hoje.difference(dUltima).inDays;
    } else if ((hoje.month > nascimento.month ||
            hoje.month < nascimento.month) &&
        (hoje.day < nascimento.day)) {
      dUltima = DateTime(hoje.year, (hoje.month - 1), nascimento.day);
      numDias = hoje.difference(dUltima).inDays;
    } else if (nascimento.month == hoje.month) {
      dUltima = DateTime(hoje.year, hoje.month, nascimento.day);
      numDias = hoje.difference(dUltima).inDays;
    }
    return numDias;
  }

  formatarData(dataSemFormatacao) {
    var dataFormatada = DateFormat("dd/MM/yyyy")
        .format(DateTime.parse(dataSemFormatacao))
        .toString();

    return dataFormatada;
  }
}
