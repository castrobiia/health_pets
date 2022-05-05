import 'package:flutter/material.dart';
import 'package:health_pets/pages/menu-calendario.page.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  //CalendarController _calendarController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<CleanCalendarEvent> selectedEvent = [];

  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.red.shade400),
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.green.shade400),
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.green.shade400),
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.green.shade400),
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.green.shade400),
      CleanCalendarEvent('Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de consulta do Thom',
          color: Colors.green.shade400),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1):
        [
      CleanCalendarEvent('Event C',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'Dia de banho e tosa do Thom',
          color: Colors.amber)
    ]
  };

  void _handleData(date) {
    setState(() {
      _selectedDay = date;
      selectedEvent = events[_selectedDay] ?? [];
    });
    print('_selectedDay: $_selectedDay');
  }

  @override
  void initState() {
    selectedEvent = events[_selectedDay] ?? [];
    super.initState();
  }

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
          PopupMenuButton<MenuItemCalendario>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              ...MenuItemsCalendario.items.map(buildItem).toList(),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Calendar(
            selectedColor: ColorTheme.rosa1,
            eventColor: ColorTheme.salmao1,
            eventDoneColor: Colors.pink,
            bottomBarColor: Colors.green,
            onDateSelected: (date) {
              return _handleData(date);
            },
            isExpanded: true,
            //expandableDateFormat: 'EEEE, dd. MMMM yyyy',
            events: events,
          ),
        ),
      ),
    );
  }
}
