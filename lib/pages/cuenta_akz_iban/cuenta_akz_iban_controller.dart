import 'package:antex/model/solicitudes_iban/solicitudes_iban.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/data_services_solicitudes_iban.dart';

class CuentaAKZIbanController extends GetxController {
  var isLoading = true.obs;

  var data = <Datum>[].obs;
  var cuentas = SolicitudesIban().obs;

  GlobalKey<FormState> formKeyCuentas = GlobalKey<FormState>();

  late TextEditingController noCuentaController, ibanController;
  late TextEditingController noCuentaEditController, ibanEditController;

  var noCuenta = '';
  var noCuentaEdit = '';
  var iban = '';
  var ibanEdit = '';

  @override
  void onInit() {
    fetchCuentas();
    noCuentaController = TextEditingController();
    noCuentaEditController = TextEditingController();
    ibanController = TextEditingController();
    ibanEditController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    noCuentaController.dispose();
    noCuentaEditController.dispose();
    ibanController.dispose();
    ibanEditController.dispose();
  }

  void fetchCuentas() async {
    isLoading(true);
    try {
      var todos = await DataServicesIban.getDatosSolicitudesIbanList();

      cuentas.value = todos;

      data.value = cuentas.value.data!;
    } finally {
      isLoading(false);
    }
  }

  String? validateNoCuenta(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateIban(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  void insertar() async {
    final isvalid = formKeyCuentas.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKeyCuentas.currentState!.save();

    var response = await DataServicesIban.solicitudesIbanPost(
        noCuentaController.text, ibanController.text);

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de cambio de cuenta insertada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchCuentas();
      update();
    }
  }

  void editar(int id) async {
    final isvalid = formKeyCuentas.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKeyCuentas.currentState!.save();

    var response = await DataServicesIban.solicitudesIbanUpdate(
        id, noCuentaEditController.text, ibanEditController.text);

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de cambio de cuenta editada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchCuentas();
      update();
    }
  }

  void delete(int idSolicitud) async {
    var response = await DataServicesIban.solicitudesIbanDelete(idSolicitud);

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

    fetchCuentas();
    update();
  }
}
