import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/servicios.dart';
import '../../../utils/colors.dart';
import '../servicios_logisticos_controller.dart';

class ServiciosPrueba extends StatefulWidget {
  @override
  State<ServiciosPrueba> createState() => _ServiciosPruebaState();
}

class _ServiciosPruebaState extends State<ServiciosPrueba> {
  //const ServiciosPrueba({Key? key}) : super(key: key);
  //CalendarFormat _calendarFormat = CalendarFormat.month;

  // DateTime _focusedDay = DateTime.now();
  final ServiciosLogisticosController controller =
      Get.put(ServiciosLogisticosController());

  List<Servicios> listaServicios = [
    Servicios('Desayuno', 5.0, false),
    Servicios('Almuerzo', 5.0, false),
    Servicios('Cena', 5.0, false),
    Servicios('Alojamiento', 5.0, false),
  ];

  List<Servicios> selectedServicios = [];

  // final Map<DateTime, List<CleanCalendarEvent>> _events = {
  //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
  //     CleanCalendarEvent(
  //       'Event A',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //           DateTime.now().day, 10, 0),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //           DateTime.now().day, 12, 0),
  //       description: 'A special event',
  //       color: Colors.blue,
  //     ),
  //     CleanCalendarEvent(
  //       'Event ricardo',
  //       startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //           DateTime.now().day, 10, 0),
  //       endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //           DateTime.now().day, 12, 0),
  //       description: 'A special event',
  //       color: Colors.blue,
  //     )
  //   ],
  // };

  @override
  void initState() {
    super.initState();
    // Force selection of today on first load, so that the list of today's events gets shown.
    _handleNewDate(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    controller.selectedDay(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Calendar(
                startOnMonday: true,
                weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                events: controller.selectedServicios,
                onRangeSelected: (range) =>
                    print('Range is ${range.from}, ${range.to}'),
                onDateSelected: (date) {
                  _handleNewDate(date);
                  controller.selectedDay(date);
                },
                //isExpandable: true,
                isExpanded: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.blue,
                eventColor: Colors.grey,
                locale: 'es_ES',
                //todayButtonText: 'Heute',
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
            ),
            _buildEventList()
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //_showDialog(context);
            showModalBottomSheet(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, setModalState) {
                    return Container(
                        child: serviciosAlojamientoModal(setModalState));
                  });
                });
          },
          backgroundColor: kColorApp,
          label: Text("Insertar Servicios"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int index) {
        final CleanCalendarEvent event = controller.lista[index];
        // final String start =
        //     DateFormat('HH:mm').format(event.startTime).toString();
        // final String end = DateFormat('HH:mm').format(event.endTime).toString();
        return ListTile(
          contentPadding:
              EdgeInsets.only(left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
          leading: Container(
            width: 10.0,
            color: event.color,
          ),
          title: Text(event.summary),
          subtitle:
              event.description.isNotEmpty ? Text(event.description) : null,
          // trailing: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [Text(start), Text(end)],
          // ),
          onTap: () {},
        );
      },
      itemCount: controller.lista.length,
    );
  }

  void _handleNewDate(date) {
    print('Date selected: $date');
  }

  Widget serviciosAlojamientoModal(StateSetter setModalState) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listaServicios.length,
                  itemBuilder: (context, index) {
                    return CardItem(
                        listaServicios[index].nombre!,
                        listaServicios[index].precio!,
                        listaServicios[index].isSelect!,
                        index,
                        setModalState);
                  }),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ConstrainedBox(
            constraints:
                BoxConstraints.tightFor(width: context.width * 0.7, height: 50),
            child: ElevatedButton(
                onPressed: () {
                  // (controller.isLoading.value == true)
                  //                 ? null
                  //                 : controller.serviciosLogisticosPost();
                },
                // icon: (controller.isLoading.value == true)
                //                 ? Container(
                //                     width: 24,
                //                     height: 24,
                //                     padding: const EdgeInsets.all(2),
                //                     child: const CircularProgressIndicator(
                //                       color: Colors.white,
                //                       strokeWidth: 3,
                //                     ),
                //                   )
                //                 : Container(),
                child: const Text('Reservar'),
                style: ElevatedButton.styleFrom(
                  primary: kColorApp,
                  shape: (RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                  textStyle: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget CardItem(String nombre, double precio, bool isSelected, int index,
      StateSetter setModalState) {
    return ListTile(
      title: Text(nombre),
      subtitle: Text('Precio: ${precio.toStringAsFixed(2)}'),
      trailing: isSelected
          ? Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: kColorApp,
            )
          : Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.grey,
            ),
      onTap: () {
        setModalState(() {
          listaServicios[index].isSelect = !listaServicios[index].isSelect!;
          if (listaServicios[index].isSelect == true) {
            selectedServicios.add(Servicios(
              listaServicios[index].nombre,
              listaServicios[index].precio,
              true,
            ));
          } else if (listaServicios[index].isSelect == false) {
            selectedServicios.removeWhere(
                (element) => element.nombre == listaServicios[index].nombre);
          }
        });
      },
    );
  }
}
