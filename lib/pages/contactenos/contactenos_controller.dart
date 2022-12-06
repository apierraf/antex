import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactenosController extends GetxController {
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  late TextEditingController correoController, mensajeController;

  var correo = '';
  var mensaje = '';

  @override
  void onInit() {
    correoController = TextEditingController();
    mensajeController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    correoController.dispose();
    mensajeController.dispose();
  }

  String? validateCorreo(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateMensaje(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }
}
