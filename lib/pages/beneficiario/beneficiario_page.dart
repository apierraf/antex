import 'package:antex/pages/beneficiario/beneficiario_controller.dart';
import 'package:antex/pages/beneficiario/widgets/beneficiario_item.dart';
import 'package:antex/pages/beneficiario/widgets/loading_beneficiario.dart';
import 'package:antex/pages/beneficiario/widgets/no_data_beneficiario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../utils/colors.dart';
import '../widgets/app_bar.dart';

class BeneficiarioPage extends StatelessWidget {
  //const BeneficiarioPage({Key? key}) : super(key: key);

  final BeneficiariosController controller = Get.put(BeneficiariosController());

  String estado = "Enviada";
  int? idSolicitud = 0;
  Color color = Colors.black;

  String? provincia;
  String? municipio;
  String? sucursales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarPage(
                title: 'BENEFICIARIOS',
                buscar: IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.search, color: Colors.white)),
                atras: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Obx(() => (controller.isLoading.value == true)
                  ? LoadingBeneficiario()
                  : (controller.data.isEmpty)
                      ? NoDataBeneficiario()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            if (controller.data[index].estado!.estado != null) {
                              if (controller.data[index].estado!.estado! ==
                                  'N') {
                                estado = 'Enviada';
                                color = azul;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'P') {
                                estado = 'En proceso';
                                color = amarillo;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'C') {
                                estado = 'Confirmado';
                                color = verde;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'D') {
                                estado = 'Denegado';
                                color = kColorApp;
                              }
                            }

                            // if (controller.data[index].solicitudBeneficiario!
                            //         .idSolicitud! !=
                            //     null) {
                            //   idSolicitud = controller.data[index]
                            //       .solicitudBeneficiario!.idSolicitud!;
                            // }

                            return BeneficiarioItem(
                              controller: controller,
                              index: index,
                              color: color,
                              estado: estado,
                              idSolicitud: idSolicitud!,
                              id: controller.data[index].id!,
                              idBeneficiario: controller.data[index]
                                  .solicitudBeneficiario!.idBeneficiario!,
                              // no_akz:
                              //     controller.data[index].solicitudBeneficiario!.noAkz!,
                              // iban: controller.data[index].solicitudIban!.iban!,
                            );
                          }))
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: kColorApp,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        children: [
          SpeedDialChild(
              child: Icon(Icons.add),
              label: 'Retiro Beneficiario',
              onTap: () {
                showModalBottomRetiroBeneficiario(context);
              }),
          SpeedDialChild(
              child: Icon(Icons.add),
              label: 'Cambio Beneficiario',
              onTap: () {
                showModalBottomCambioBeneficiario(context);
              }),
        ],
      ),
    );
  }

  Future<dynamic> showModalBottomCambioBeneficiario(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Obx((() => SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                            key: controller.formKeyBeneficiarios,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Text(
                                    "CAMBIO BENEFICIARIO",
                                    style: GoogleFonts.robotoCondensed(
                                        color: kColorApp,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Nombre",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType: TextInputType.name,
                                      controller: controller.nombreController,
                                      onSaved: (value) {
                                        controller.nombre = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateNombre(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Apellidos",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller:
                                          controller.apellidosController,
                                      onSaved: (value) {
                                        controller.apellidos = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateApellidos(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "CI",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.ciController,
                                      onSaved: (value) {
                                        controller.ci = value!;
                                      },
                                      validator: (value) {
                                        return controller.validateCi(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Cuenta",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.cuentaController,
                                      onSaved: (value) {
                                        controller.cuenta = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateCuenta(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Tarjeta",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.tarjetaController,
                                      onSaved: (value) {
                                        controller.tarjeta = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateTarjeta(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    value: provincia,
                                    items: controller.listaprovincias
                                        .map(buildMenuItem)
                                        .toList(),
                                    // icon: Icon(
                                    //   Icons.arrow_drop_down,
                                    //   color: Colors.black,
                                    //   size: 20,
                                    // ),
                                    onChanged: (value) => setState(() {
                                      this.provincia = value.toString();
                                      this.municipio = null;
                                      this.sucursales = null;
                                      //controller.listaMunicipios.clear();
                                      controller.fetchMunicipios(
                                          controller.obtenerIdProvincia(
                                              value.toString()));
                                    }),
                                    // onSaved: (value) => {
                                    //   controller.fetchMunicipios(controller
                                    //       .obtenerIdProvincia(value.toString()))
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Provincia",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    //controller.valueEstipendio.value = value.toString();

                                    //value: controller.valueEstipendio.value,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Obx(
                                    () => (controller
                                                .isLoadingMunicipio.value ==
                                            true)
                                        ? CircularProgressIndicator()
                                        : DropdownButtonFormField(
                                            isExpanded: true,
                                            value: municipio,
                                            items: controller.listaMunicipios
                                                .map(buildMenuItem)
                                                .toList(),
                                            // icon: Icon(
                                            //   Icons.arrow_drop_down,
                                            //   color: Colors.black,
                                            //   size: 20,
                                            // ),
                                            onChanged: (value) => setState(() {
                                              this.municipio = value.toString();
                                              this.sucursales = null;
                                              controller.fetchSucursales(
                                                  controller.obtenerIdMunicipio(
                                                      value.toString()));
                                            }),
                                            decoration: InputDecoration(
                                              labelText: "Municipio",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            //controller.valueEstipendio.value = value.toString();

                                            //value: controller.valueEstipendio.value,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Obx(
                                    () => (controller.isLoadingSucursal.value ==
                                            true)
                                        ? CircularProgressIndicator()
                                        : DropdownButtonFormField(
                                            isExpanded: true,
                                            value: sucursales,
                                            items: controller.listaSucursales
                                                .map(buildMenuItem)
                                                .toList(),
                                            // icon: Icon(
                                            //   Icons.arrow_drop_down,
                                            //   color: Colors.black,
                                            //   size: 20,
                                            // ),
                                            onChanged: (value) => setState(() =>
                                                this.sucursales =
                                                    value.toString()),
                                            decoration: InputDecoration(
                                              labelText: "Sucursales",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            //controller.valueEstipendio.value = value.toString();

                                            //value: controller.valueEstipendio.value,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: context.width * 0.4),
                                      child: IconsOutlineButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          iconData: Icons.cancel_outlined,
                                          textStyle:
                                              GoogleFonts.robotoCondensed(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                          iconColor: Colors.grey,
                                          text: 'Cancel'),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: context.width * 0.4),
                                      child: IconsButton(
                                          onPressed: () {
                                            controller
                                                .insertarCambioBeneficiario(
                                                    this.provincia!,
                                                    this.municipio!,
                                                    this.sucursales!);
                                            Navigator.pop(context);

                                            // controller.insertar();
                                            // controller.ibanController.clear();
                                            // controller.noCuentaController.clear();
                                          },
                                          color: kColorApp,
                                          textStyle:
                                              GoogleFonts.robotoCondensed(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          iconColor: Colors.white,
                                          text: 'Aceptar'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ))),
            );
          });
        });
  }

  Future<dynamic> showModalBottomRetiroBeneficiario(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Obx((() => SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Form(
                            key: controller.formKeyBeneficiarios,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Text(
                                    "CAMBIO BENEFICIARIO",
                                    style: GoogleFonts.robotoCondensed(
                                        color: kColorApp,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Nombre",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType: TextInputType.name,
                                      controller: controller.nombreController,
                                      onSaved: (value) {
                                        controller.nombre = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateNombre(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Apellidos",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller:
                                          controller.apellidosController,
                                      onSaved: (value) {
                                        controller.apellidos = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateApellidos(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "CI",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.ciController,
                                      onSaved: (value) {
                                        controller.ci = value!;
                                      },
                                      validator: (value) {
                                        return controller.validateCi(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Cuenta",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.cuentaController,
                                      onSaved: (value) {
                                        controller.cuenta = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateCuenta(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: kColorApp),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        labelText: "Tarjeta",
                                        suffixIcon: Icon(CupertinoIcons.pencil),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: controller.tarjetaController,
                                      onSaved: (value) {
                                        controller.tarjeta = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateTarjeta(value!);
                                      }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: DropdownButtonFormField(
                                    isExpanded: true,
                                    value: provincia,
                                    items: controller.listaprovincias
                                        .map(buildMenuItem)
                                        .toList(),
                                    // icon: Icon(
                                    //   Icons.arrow_drop_down,
                                    //   color: Colors.black,
                                    //   size: 20,
                                    // ),
                                    onChanged: (value) => setState(() {
                                      this.provincia = value.toString();
                                      this.municipio = null;
                                      this.sucursales = null;
                                      //controller.listaMunicipios.clear();
                                      controller.fetchMunicipios(
                                          controller.obtenerIdProvincia(
                                              value.toString()));
                                    }),
                                    // onSaved: (value) => {
                                    //   controller.fetchMunicipios(controller
                                    //       .obtenerIdProvincia(value.toString()))
                                    // },
                                    decoration: InputDecoration(
                                      labelText: "Provincia",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    //controller.valueEstipendio.value = value.toString();

                                    //value: controller.valueEstipendio.value,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Obx(
                                    () => (controller
                                                .isLoadingMunicipio.value ==
                                            true)
                                        ? CircularProgressIndicator()
                                        : DropdownButtonFormField(
                                            isExpanded: true,
                                            value: municipio,
                                            items: controller.listaMunicipios
                                                .map(buildMenuItem)
                                                .toList(),
                                            // icon: Icon(
                                            //   Icons.arrow_drop_down,
                                            //   color: Colors.black,
                                            //   size: 20,
                                            // ),
                                            onChanged: (value) => setState(() {
                                              this.municipio = value.toString();
                                              this.sucursales = null;
                                              controller.fetchSucursales(
                                                  controller.obtenerIdMunicipio(
                                                      value.toString()));
                                            }),
                                            decoration: InputDecoration(
                                              labelText: "Municipio",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            //controller.valueEstipendio.value = value.toString();

                                            //value: controller.valueEstipendio.value,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    right: 25,
                                  ),
                                  child: Obx(
                                    () => (controller.isLoadingSucursal.value ==
                                            true)
                                        ? CircularProgressIndicator()
                                        : DropdownButtonFormField(
                                            isExpanded: true,
                                            value: sucursales,
                                            items: controller.listaSucursales
                                                .map(buildMenuItem)
                                                .toList(),
                                            // icon: Icon(
                                            //   Icons.arrow_drop_down,
                                            //   color: Colors.black,
                                            //   size: 20,
                                            // ),
                                            onChanged: (value) => setState(() =>
                                                this.sucursales =
                                                    value.toString()),
                                            decoration: InputDecoration(
                                              labelText: "Sucursales",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: kColorApp),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            ),
                                            //controller.valueEstipendio.value = value.toString();

                                            //value: controller.valueEstipendio.value,
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: context.width * 0.4),
                                      child: IconsOutlineButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          iconData: Icons.cancel_outlined,
                                          textStyle:
                                              GoogleFonts.robotoCondensed(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                          iconColor: Colors.grey,
                                          text: 'Cancel'),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints.tightFor(
                                          width: context.width * 0.4),
                                      child: IconsButton(
                                          onPressed: () {
                                            controller
                                                .insertarCambioBeneficiario(
                                                    this.provincia!,
                                                    this.municipio!,
                                                    this.sucursales!);
                                            Navigator.pop(context);

                                            // controller.insertar();
                                            // controller.ibanController.clear();
                                            // controller.noCuentaController.clear();
                                          },
                                          color: kColorApp,
                                          textStyle:
                                              GoogleFonts.robotoCondensed(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                          iconColor: Colors.white,
                                          text: 'Aceptar'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            )),
                      ],
                    ),
                  ))),
            );
          });
        });
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
