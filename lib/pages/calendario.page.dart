import 'package:flutter/material.dart';
import 'package:health_pets/class/util.dart';
import 'package:health_pets/pages/alert-dialog.dart';
import 'package:health_pets/pages/editar-usuario.page.dart';
import 'package:health_pets/pages/logout.page.dart';
import 'package:health_pets/pages/pet.page.dart';
import 'package:health_pets/repository/lembrete-repository.dart';
import 'package:health_pets/repository/usuario-repository.dart';
import 'package:health_pets/themes/color_theme.dart';
import 'package:health_pets/widgets/widgets.dart';
import 'package:intl/intl.dart';
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

  Map<DateTime, List<CleanCalendarEvent>> events = {};

  void _handleData(date) {
    setState(() {
      _selectedDay = date;
      selectedEvent = events[_selectedDay] ?? [];
    });
  }

  @override
  // var conexaoLembrete;
  // void initState() {
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.calendar),
        centerTitle: true,
        elevation: 1,
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
                  onTap: () {
                    setarMaterialPageRoute(context, EditarUsuario());
                  },
                ),
                ListTile(
                  //Icons.vpn_key
                  leading: Icon(Icons.password),
                  title: const Text('Alterar Senha'),
                  onTap: () {
                    setarMaterialPageRoute(context, EditarUsuario());
                  },
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
      body: FutureBuilder(
        future: LembreteRepository().getLembretes(DateTime.now().toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: Container(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return Center(
              child: Container(
                child: Text(AppLocalizations.of(context)!.errorLoading),
              ),
            );
          }

          var listaLembretes = snapshot.data;

          events = {
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day): listaLembretes as List<CleanCalendarEvent>
          };

          return Container(
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
                  // return _handleData(date);
                  // return getEvents(events, date.toString());
                },
                isExpanded: true,
                //expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                events: events,
              ),
            ),
          );
        },
      ),
    );
  }
}
