import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:health_pets/models/lembrete-model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LembreteRepository {
  var url = 'https://www.healthpets.app.br/api/lembrete';

  getLembretes(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token').toString();

    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${token}"
    };

    var dataEvento = DateFormat("dd/MM/yyyy").format(DateTime.parse(data));

    List<String> camposData = dataEvento.toString().split('/');

    int dia = int.parse(camposData[0]);
    int mes = int.parse(camposData[1]);
    int ano = int.parse(camposData[2]);

    var body = jsonEncode({
      'dia': dia,
      'mes': mes,
      'ano': ano,
    });

    var response = await http.post(Uri.parse(url), headers: header, body: body);

    List listaLembretes = jsonDecode(response.body);

    var list = listaLembretes.map((item) {
      var horario = item['hora'];
      List<String> camposHora = horario.toString().split(':');

      int hora = int.parse(camposHora[0]);
      int minuto = int.parse(camposHora[1]);

      return CleanCalendarEvent(item['titulo'],
          startTime: DateTime(dia, mes, ano, hora, minuto),
          endTime: DateTime(dia, mes, ano, hora + 1, minuto),
          color: Colors.green.shade400);
    }).toList();

    return list;
  }
}
