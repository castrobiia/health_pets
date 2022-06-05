import 'package:flutter/material.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/pages/menu-calendario.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  }

  @override
  void initState() {
    selectedEvent = events[_selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("current locale ${Localizations.localeOf(context).languageCode}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.calendar),
        centerTitle: true,
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
      drawer: Drawer(
        child: FutureBuilder<dynamic>(
          future: UsuarioRepository().getUsuario(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                  child: Container(child: CircularProgressIndicator()));
            }
            if (snapshot.hasError) {
              return Center(
                child: Container(
                  child: Text(AppLocalizations.of(context)!.errorLoading),
                ),
              );
            }
            final usuario = snapshot.data["user"];
            final qntdAnimais = snapshot.data["animais"];
            return Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // UserAccountsDrawerHeader(
                //   arrowColor: Colors.pink,
                //   accountName: Text(usuario['nome'] ?? ''),
                //   accountEmail: Text(usuario['email'] ?? ''),
                //   margin: EdgeInsets.only(bottom: 20),
                // ),
                Container(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  width: double.maxFinite,
                  color: ColorTheme.salmao1,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        usuario['nome'] ?? '',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(usuario['email'] ?? ''),
                      SizedBox(height: 5),
                      Text('Animais: ${qntdAnimais.toString()}'),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                  ),
                  title: const Text('Editar Perfil'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: const Text('Excluir Conta'),
                  onTap: () {
                    confirmarExclusaoUsuario(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: const Text('Sair'),
                  onTap: () {
                    setarMaterialPageRoute(context, LogoutPage());
                  },
                ),
                Divider(color: Colors.black87),
                ListTile(
                  leading: Icon(Icons.pets),
                  title: const Text('Pets'),
                  onTap: () {
                    setarMaterialPageRoute(context, PetPage());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: const Text('Calendário'),
                  onTap: () {
                    setarMaterialPageRoute(context, Calendario());
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Calendar(
            locale: Localizations.localeOf(context).languageCode,
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
