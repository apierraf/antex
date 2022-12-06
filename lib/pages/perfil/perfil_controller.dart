import 'package:antex/model/perfil/perfil.dart';
import 'package:antex/services/data_services_perfil.dart';
import 'package:antex/services/data_services_testimonios.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PerfilController extends GetxController {
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyCambioContrasena = GlobalKey<FormState>();

  var isLoading = true.obs;
  var isLoadingTestimonio = false.obs;

  var perfil = Perfil().obs;

  late TextEditingController testimonioController,
      actualController,
      contrasenaController,
      nuevacontrasenaController;

  var testimonio = '';
  var actual = '';
  var contrasena = '';
  var nuevacontrasena = '';

  @override
  void onInit() {
    testimonioController = TextEditingController();
    actualController = TextEditingController();
    contrasenaController = TextEditingController();
    nuevacontrasenaController = TextEditingController();
    fetch();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    testimonioController.dispose();
    actualController.dispose();
    contrasenaController.dispose();
    nuevacontrasenaController.dispose();
  }

  void fetch() async {
    isLoading(true);
    try {
      await Future.delayed(Duration(seconds: 2), () {});

      var todos = await DataServicesPerfil.getDatosPerfilList();

      perfil.value = todos;
    } finally {
      isLoading(false);
    }
  }

  void insertar() async {
    final isvalid = formKeyCambioContrasena.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKeyCambioContrasena.currentState!.save();

    var response = await DataServicesPerfil.cambioContrasena(
        actualController.text,
        contrasenaController.text,
        nuevacontrasenaController.text);

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Contraseña modificada satisfactoriamente!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      update();
    }
  }

  void insertarTestimonio() async {
    isLoadingTestimonio(true);

    final isvalid = formKey1.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKey1.currentState!.save();

    var response;

    try {
      response = await DataServicesTestimonios.testimonioPost(
          testimonioController.text);
    } finally {
      isLoadingTestimonio(false);
    }

    if (response != null) {
      if (response.status == 'Success') {
        Get.snackbar(
          "CORRECTO!!!",
          "Testimonio insertado con exito!!!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          isDismissible: true,
        );

        update();
      }
    }
  }

  String? validateTestimonio(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateActual(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateContrasena(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateNuevaContrasena(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }
}
