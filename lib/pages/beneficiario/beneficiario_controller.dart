import 'package:antex/model/beneficiario/beneficiarioActivo.dart';
import 'package:antex/model/municipios.dart';
import 'package:antex/model/provincias.dart';
import 'package:antex/model/sucursales.dart';
import 'package:antex/services/data_services_beneficiario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/beneficiario/beneficiarios.dart';

class BeneficiariosController extends GetxController {
  var isLoading = true.obs;
  var isLoadingMunicipio = false.obs;
  var isLoadingSucursal = false.obs;

  var data = <Datum>[].obs;
  var beneficiarios = Beneficiarios().obs;
  var beneficiarioActivo = BeneficiarioActivo().obs;
  var provincias = <Provincias>[].obs;
  var listaprovincias = <String>[].obs;
  var municipios = <Municipios>[].obs;
  var listaMunicipios = <String>[].obs;
  var sucursales = <Sucursales>[].obs;
  var listaSucursales = <String>[].obs;

  GlobalKey<FormState> formKeyBeneficiarios = GlobalKey<FormState>();

  late TextEditingController nombreController,
      apellidosController,
      direccionController,
      ciController,
      tarjetaController,
      cuentaController,
      provinciaController,
      municipioController,
      sucursalController;
  late TextEditingController nombreEditController,
      apellidosEditController,
      direccionEditController,
      ciEditController,
      tarjetaEditController,
      cuentaEditController,
      provinciaEditController,
      municipioEditController,
      sucursalEditController;

  var nombre = '';
  var apellidos = '';
  var direccion = '';
  var ci = '';
  var tarjeta = '';
  var cuenta = '';
  var ibanEdit = '';
  var provinciaEdit = '';
  var municipioEdit = '';
  var sucursalEdit = '';

  @override
  void onInit() {
    fetchBeneficiarioActivo();
    fetchBeneficiarios();
    fetchProvincia();
    nombreController = TextEditingController();
    nombreEditController = TextEditingController();
    apellidosController = TextEditingController();
    apellidosEditController = TextEditingController();
    direccionController = TextEditingController();
    direccionEditController = TextEditingController();
    ciController = TextEditingController();
    ciEditController = TextEditingController();
    tarjetaController = TextEditingController();
    tarjetaEditController = TextEditingController();
    cuentaController = TextEditingController();
    cuentaEditController = TextEditingController();
    provinciaController = TextEditingController();
    provinciaEditController = TextEditingController();
    municipioController = TextEditingController();
    municipioEditController = TextEditingController();
    sucursalController = TextEditingController();
    sucursalEditController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nombreController.dispose();
    nombreEditController.dispose();
    apellidosController.dispose();
    apellidosEditController.dispose();
    direccionController.dispose();
    direccionEditController.dispose();
    ciController.dispose();
    ciEditController.dispose();
    tarjetaController.dispose();
    tarjetaEditController.dispose();
    cuentaController.dispose();
    cuentaEditController.dispose();
    provinciaController.dispose();
    provinciaEditController.dispose();
    municipioController.dispose();
    municipioEditController.dispose();
    sucursalController.dispose();
    sucursalEditController.dispose();
  }

  void fetchBeneficiarios() async {
    isLoading(true);
    try {
      var todos = await DataServicesBeneficiarios.getDatosBeneficiariosList();

      beneficiarios.value = todos;

      data.value = beneficiarios.value.data!;
    } finally {
      isLoading(false);
    }
  }

  void fetchBeneficiarioActivo() async {
    isLoading(true);
    try {
      var todos = await DataServicesBeneficiarios.getDatosBeneficiarioActivo();

      beneficiarioActivo.value = todos;

      //data.value = beneficiarios.value.data!;
    } finally {
      isLoading(false);
    }
  }

  void fetchProvincia() async {
    //listaprovincias.clear();
    var todos = await DataServicesBeneficiarios.getDatosProvinciasList();

    provincias.value = todos;

    for (int i = 0; i < provincias.length; i++) {
      listaprovincias.add(provincias[i].text!);
    }
  }

  int obtenerIdProvincia(String nombre) {
    var id;

    for (int i = 0; i < provincias.length; i++) {
      if (provincias[i].text! == nombre) {
        id = provincias[i].value;
      }
    }

    return id;
  }

  void fetchMunicipios(int idProvincia) async {
    isLoadingMunicipio(true);
    try {
      listaMunicipios.clear();
      var todos =
          await DataServicesBeneficiarios.getDatosMunicipiosList(idProvincia);

      municipios.value = todos;

      print('get municipios');

      for (int i = 0; i < municipios.length; i++) {
        listaMunicipios.add(municipios[i].text!);
      }
    } finally {
      isLoadingMunicipio(false);
    }
  }

  int obtenerIdMunicipio(String nombre) {
    var id;

    for (int i = 0; i < municipios.length; i++) {
      if (municipios[i].text! == nombre) {
        id = municipios[i].value;
      }
    }

    return id;
  }

  void fetchSucursales(int idMuncipio) async {
    isLoadingSucursal(true);
    try {
      listaSucursales.clear();
      var todos =
          await DataServicesBeneficiarios.getDatosSucursalesList(idMuncipio);

      sucursales.value = todos;

      print('get municipios');

      for (int i = 0; i < sucursales.length; i++) {
        listaSucursales.add(sucursales[i].text!);
      }
    } finally {
      isLoadingSucursal(false);
    }
  }

  int obtenerIdSucursal(String nombre) {
    var id;

    for (int i = 0; i < sucursales.length; i++) {
      if (sucursales[i].text! == nombre) {
        id = sucursales[i].value;
      }
    }

    return id;
  }

  String? validateNombre(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateApellidos(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateDireccion(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateCi(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateTarjeta(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  String? validateCuenta(String value) {
    if (value.isEmpty) {
      return "Campo obligatorio";
    }
    return null;
  }

  void insertarCambioBeneficiario(
      String provincia, String municipio, String sucursal) async {
    final isvalid = formKeyBeneficiarios.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKeyBeneficiarios.currentState!.save();

    var idProvincia = obtenerIdProvincia(provincia);
    var idMunicipio = obtenerIdMunicipio(municipio);
    var idSucursal = obtenerIdSucursal(sucursal);

    var response = await DataServicesBeneficiarios.beneficiarioPost(
        nombreController.text,
        apellidosController.text,
        apellidosController.text,
        "Nada",
        ciController.text,
        tarjetaController.text,
        cuentaController.text,
        idProvincia.toString(),
        idMunicipio.toString(),
        idSucursal.toString());

    var idBeneficiario = response.idBeneficiario;

    var motivo = "N";

    if (beneficiarioActivo.value.data != null) {
      motivo = "C";
    }

    var response1 = await DataServicesBeneficiarios.solicitudesBeneficiarioPost(
        motivo, idBeneficiario.toString());

    if (response1.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de cambio de beneficiario insertada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchBeneficiarios();
      fetchProvincia();
      update();
    }
  }

  void insertarRetiroBeneficiario() async {
    var idBeneficiario = 0;

    var motivo = "E";

    if (beneficiarioActivo.value.data != null) {
      idBeneficiario = beneficiarioActivo.value.data!.id!;
    }

    var response1 = await DataServicesBeneficiarios.solicitudesBeneficiarioPost(
        motivo, idBeneficiario.toString());

    if (response1.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de cambio de beneficiario insertada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchBeneficiarios();
      fetchProvincia();
      update();
    }
  }

  void editar(int idBeneficiario, String provincia, String municipio,
      String sucursal) async {
    final isvalid = formKeyBeneficiarios.currentState!.validate();

    if (!isvalid) {
      return;
    }

    formKeyBeneficiarios.currentState!.save();

    var idProvincia = obtenerIdProvincia(provincia);
    var idMunicipio = obtenerIdMunicipio(municipio);
    var idSucursal = obtenerIdSucursal(sucursal);

    var response = await DataServicesBeneficiarios.beneficiarioPut(
        idBeneficiario,
        nombreController.text,
        apellidosController.text,
        apellidosController.text,
        "Nada",
        ciController.text,
        tarjetaController.text,
        cuentaController.text,
        idProvincia.toString(),
        idMunicipio.toString(),
        idSucursal.toString());

    if (response.status == 'Success') {
      Get.snackbar(
        "CORRECTO!!!",
        "Solicitud de beneficiario editada con exito!!!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        isDismissible: true,
      );

      fetchBeneficiarios();
      fetchProvincia();
      update();
    }
  }

  void delete(int id) async {
    var response =
        await DataServicesBeneficiarios.solicitudesBeneficiarioDelete(id);

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

    fetchBeneficiarios();
    fetchProvincia();
    update();
  }

  void showDataEditar(index) {
    // fetchMunicipios(data[index]
    //     .solicitudBeneficiario!
    //     .beneficiario!
    //     .sucursal!
    //     .municipio!
    //     .idProvincia!);
    // fetchSucursales(data[index]
    //     .solicitudBeneficiario!
    //     .beneficiario!
    //     .sucursal!
    //     .municipio!
    //     .id!);
    nombreEditController.text =
        data[index].solicitudBeneficiario!.beneficiario!.nombre1!;
    apellidosEditController.text =
        data[index].solicitudBeneficiario!.beneficiario!.apellido1!;
    ciEditController.text =
        data[index].solicitudBeneficiario!.beneficiario!.ci!;
    cuentaEditController.text =
        data[index].solicitudBeneficiario!.beneficiario!.cuenta!;
    tarjetaEditController.text =
        data[index].solicitudBeneficiario!.beneficiario!.tarjeta!;

    for (int i = 0; i < provincias.length; i++) {
      if (provincias[i].value ==
          data[index]
              .solicitudBeneficiario!
              .beneficiario!
              .sucursal!
              .municipio!
              .idProvincia) {
        provinciaEdit = provincias[i].text!;
      }
    }
    municipioEdit = data[index]
        .solicitudBeneficiario!
        .beneficiario!
        .sucursal!
        .municipio!
        .descripcion!;
    sucursalEdit =
        data[index].solicitudBeneficiario!.beneficiario!.sucursal!.banco! +
            "-" +
            data[index].solicitudBeneficiario!.beneficiario!.sucursal!.numero!;
  }
}
