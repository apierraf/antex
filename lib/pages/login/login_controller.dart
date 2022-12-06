import 'package:antex/services/data_services_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/login.dart';

class LoginController extends GetxController with StateMixin<Login> {
  var isLoading = false.obs;
  var passwordVisible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _getStorage = GetStorage();
  final storageKeyExpediente = 'expediente';
  final storageKeyToken = 'token';
  final storageKeyAngola = 'angola';

  late TextEditingController usuarioController, contrasenaController;

  var usuario = '';
  var contrasena = '';

  @override
  void onInit() {
    usuarioController = TextEditingController();
    contrasenaController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usuarioController.dispose();
    contrasenaController.dispose();
  }

  String? validateUsuario(String value) {
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

  void changeVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void login() async {
    isLoading(true);

    final isvalid = formKey.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKey.currentState!.save();

    var response;

    try {
      response = await DataServicesLogin.login(
          usuarioController.text, contrasenaController.text);
    } catch (e) {
      Get.snackbar(
        "Error",
        "${e}!!!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );
    } finally {
      isLoading(false);
    }

    if (response != null) {
      if (response.status == 'Success') {
        var expediente = response.data!.expediente;
        var token = response.data!.token;
        var angola = response.data!.angola;

        _getStorage.write(storageKeyExpediente, expediente);
        _getStorage.write(storageKeyToken, token);
        _getStorage.write(storageKeyAngola, angola);

        Get.snackbar(
          "Bienvenido",
          "Bienvenido a Colaborar ANTEX!!!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 5),
          isDismissible: true,
        );

        Get.offNamed('/dashboard');
      }
      // if (response.status == 'Error') {
      //   Get.snackbar(
      //     "Error",
      //     "Credenciales Incorrectas!!!",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.redAccent,
      //     borderRadius: 20,
      //     margin: EdgeInsets.all(15),
      //     colorText: Colors.white,
      //     duration: Duration(seconds: 5),
      //     isDismissible: true,
      //   );
      // }
    }
  }
}
