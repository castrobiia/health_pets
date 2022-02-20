import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu.page.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  _CalendarioPageState createState() => _CalendarioPageState();
}

class _CalendarioPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Calendário"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 1,
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItems.items.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SfCalendar(
          //mostrar caléndario por mês
          view: CalendarView.month,
          //dia da semana começando no domingo
          firstDayOfWeek: 0,
          dataSource: CompromissoCalendario(getAppointments()),
          //data de exibição
          //initialDisplayDate: DateTime(2022, 02, 02),
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> compromissos = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime horaInicio =
      DateTime(today.year, today.month, today.day, 22, 0, 0);
  final DateTime horaFim = horaInicio.add(const Duration(hours: 1));

  compromissos.add(Appointment(
    startTime: horaInicio,
    endTime: horaFim,
    subject: 'Consulta',
    recurrenceRule: 'FREQ=DAILY;COUNT=5',
    color: Colors.yellow,
  ));

  return compromissos;
}

class CompromissoCalendario extends CalendarDataSource {
  CompromissoCalendario(List<Appointment> source) {
    appointments = source;
  }
}
