import 'package:antex/data/servicios.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../servicios_logisticos_controller.dart';

class ServiciosAlojamientoPage extends StatefulWidget {
  //const ServiciosAlojamientoPage({Key? key}) : super(key: key);

  @override
  _ServiciosAlojamientoPageState createState() =>
      _ServiciosAlojamientoPageState();
}

class _ServiciosAlojamientoPageState extends State<ServiciosAlojamientoPage> {
  late Map<DateTime, List<Servicios>> _selectedServicios;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final ServiciosLogisticosController controller =
      Get.put(ServiciosLogisticosController());

  TextEditingController _textController = TextEditingController();

  //late List<Servicios> _selectedServicios;

  List<Servicios> listaServicios = [
    Servicios('Desayuno', 5.0, false),
    Servicios('Almuerzo', 5.0, false),
    Servicios('Cena', 5.0, false),
    Servicios('Alojamiento', 5.0, false),
  ];

  List<Servicios> selectedServicios = [];

  @override
  void initState() {
    // TODO: implement initState
    //_selectedServicios = {};

    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  List<Servicios> _getServiciosfromDay(DateTime date) {
    //_selectedServicios = controller.selectedServicios;
    return _selectedServicios[date] ?? [];
  }

  // List<Servicios> _groupEvent(DateTime date1) {
  //   List<Servicios> data = [];
  //   controller.data.forEach((element) {
  //     if (element.solicitudesServicio!.isNotEmpty) {
  //       DateTime date = DateTime(
  //           element.solicitudesServicio![0].fecha!.year,
  //           element.solicitudesServicio![0].fecha!.month,
  //           element.solicitudesServicio![0].fecha!.day,
  //           12);
  //       if (date == date1) {
  //         if (_selectedServicios[date] == null) _selectedServicios[date] = [];
  //         data.add(Servicios(
  //             'Almuerzo', 5, element.solicitudesServicio![0].almuerzo!));
  //       }
  //     }
  //   });
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TableCalendar(
                focusedDay: selectedDay,
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2050),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    formatButtonShowsNext: true,
                    titleTextStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w800)),
                startingDayOfWeek: StartingDayOfWeek.monday,
                daysOfWeekVisible: true,
                calendarFormat: CalendarFormat.month,
                onFormatChanged: (CalendarFormat _format) {},
                eventLoader: _getServiciosfromDay,
                onDaySelected: (DateTime selectDay, DateTime focusDay) {
                  setState(() {
                    selectedDay = selectDay;
                    focusedDay = focusDay;
                    _getServiciosfromDay(selectDay);
                  });
                },
                selectedDayPredicate: (DateTime date) {
                  return isSameDay(selectedDay, date);
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  todayTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  selectedTextStyle:
                      TextStyle(fontSize: 20, color: Colors.white),
                  defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                  weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _getServiciosfromDay(selectedDay).length,
                  itemBuilder: (context, index) {
                    final item = _getServiciosfromDay(selectedDay)[index];

                    return ListTile(
                      title: Text(item.nombre!),
                    );
                  })
            ],
          ),
        ),
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
    );
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
                  /*(controller.isLoading.value == true)
                                  ? null
                                  : controller.login();*/
                },
                /*icon: (controller.isLoading.value == true)
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Container(),*/
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
