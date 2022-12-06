import 'package:antex/data/servicios.dart';
import 'package:antex/services/data_services_servicios_logisticos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:get/get.dart';

import '../../model/servicios_logisticos/servicios_logisticos.dart';
import '../../model/vuelo_proximo.dart';
import '../../services/data_services_vuelos.dart';

class ServiciosLogisticosController extends GetxController {
  var isLoading = true.obs;
  var isLoadingPost = true.obs;
  var data = <Datum>[].obs;
  var serviciosLogisticos = ServiciosLogisticos().obs;
  var vueloProximo = VueloProximo().obs;

  var selectedProducto = <Servicios>[].obs;
  var listaServiciosLogisticos = <Servicios>[].obs;
  //final Map<DateTime, List<Servicios>> selectedServicios = {};
  final Map<DateTime, List<CleanCalendarEvent>> selectedServicios = {};
  //var listaSer = <Servicios>[].obs;
  var listaSer = <CleanCalendarEvent>[].obs;

  RxList<CleanCalendarEvent> lista = <CleanCalendarEvent>[].obs;

  List<Servicios> listaServicios = [
    Servicios('Desayuno', 5.0, false),
    Servicios('Almuerzo', 5.0, false),
    Servicios('Cena', 5.0, false),
    Servicios('Alojamiento', 5.0, false),
  ].obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  selectedDay(DateTime selectDay) {
    if (selectDay == DateTime.now()) {
      lista.value = selectedServicios[selectDay]!;
      print(lista[0].summary);
      update();
    }
  }

  void fetch() async {
    isLoading(true);
    try {
      var todosProximo = await DataServicesVuelos.getDatosProximoVueloList();

      vueloProximo.value = todosProximo;

      var todos = await DataServicesServiciosLogisticos
          .getDatosServiciosLogisticosList();

      serviciosLogisticos.value = todos;

      data.value = serviciosLogisticos.value.data!;

      for (int i = 0; i < data.length; i++) {
        if (data[i].solicitudesServicio!.isNotEmpty) {
          listaSer.clear();
          for (int j = 0; j < data[i].solicitudesServicio!.length; j++) {
            if (data[i].solicitudesServicio![j].desayuno == true) {
              listaSer.add(
                CleanCalendarEvent(
                  'Desayuno',
                  startTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 10, 0),
                  endTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                  description: '5 pesos',
                  color: Colors.blue,
                ),
              );
            }
            if (data[i].solicitudesServicio![j].almuerzo == true) {
              listaSer.add(
                CleanCalendarEvent(
                  'Almuerzo',
                  startTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 10, 0),
                  endTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                  description: '5 pesos',
                  color: Colors.blue,
                ),
              );
            }
            if (data[i].solicitudesServicio![j].cena == true) {
              listaSer.add(
                CleanCalendarEvent(
                  'Cena',
                  startTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 10, 0),
                  endTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                  description: '5 pesos',
                  color: Colors.blue,
                ),
              );
            }
            if (data[i].solicitudesServicio![j].alojamiento == true) {
              listaSer.add(
                CleanCalendarEvent(
                  'Alojamiento',
                  startTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 10, 0),
                  endTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12, 0),
                  description: '5 pesos',
                  color: Colors.blue,
                ),
              );
            }

            selectedServicios[data[i].solicitudesServicio![0].fecha!] =
                listaSer;
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }

  void serviciosLogisticosPost(String fecha, bool desayuno, bool almuerzo,
      bool cena, bool alojamiento) async {
    isLoadingPost(true);

    var response;

    try {
      response = await DataServicesServiciosLogisticos.serviciosLogisticosPost(
          vueloProximo.value.data!.id!,
          fecha,
          desayuno,
          almuerzo,
          cena,
          alojamiento);
    } finally {
      isLoadingPost(false);
    }

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de estipendio insertada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      // fetchEstipendios();
      update();
    }
  }
}
