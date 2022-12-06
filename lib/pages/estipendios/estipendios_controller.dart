import 'package:antex/model/montos.dart';
import 'package:antex/model/solicitudes_estipendios/solicitudes_estipendios.dart';
import 'package:antex/services/data_services_solicitudes_estipendios.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstipendiosController extends GetxController {
  var isLoading = true.obs;
  var isLoadingPost = false.obs;
  var data = <Datum>[].obs;

  var estipendios = SolicitudesEstipendios().obs;
  var montos = Montos().obs;
  var listaMontos = <String>[].obs;

  var valueEstipendio = "".obs;

  @override
  void onInit() {
    fetchEstipendios();
    super.onInit();
  }

  void fetchEstipendios() async {
    isLoading(true);
    try {
      var todos = await DataServicesSolicitudesEstipendios
          .getDatosSolicitudesEstipendiosList();

      estipendios.value = todos;

      data.value = estipendios.value.data!;

      var todosMontos =
          await DataServicesSolicitudesEstipendios.getDatosMontosList();

      montos.value = todosMontos;

      listaMontos.value = montos.value.listMontos!;
    } finally {
      isLoading(false);
    }
  }

  void insertar(String valor) async {
    isLoadingPost(true);

    if (valor != null) {
      var response;

      try {
        response =
            await DataServicesSolicitudesEstipendios.solicitudesEstipendiosPost(
                valor);
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

        fetchEstipendios();
        update();
      }
    } else {
      Get.snackbar(
        "ERROR!!!",
        "Valor no puede estar vacio!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );
    }
  }

  void editar(int id, String valor) async {
    var response =
        await DataServicesSolicitudesEstipendios.solicitudesEstipendioUpdate(
            id, valor);

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de estipendio editada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchEstipendios();
      update();
    }
  }

  void delete(int idSolicitud) async {
    var response =
        await DataServicesSolicitudesEstipendios.solicitudesEstipendioDelete(
            idSolicitud);

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de cambio de cuenta eliminada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );
    }

    fetchEstipendios();
    update();
  }
}
