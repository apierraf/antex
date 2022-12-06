import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../../../utils/colors.dart';
import '../beneficiario_controller.dart';

class BeneficiarioItem extends StatelessWidget {
  const BeneficiarioItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.color,
    required this.estado,
    required this.idSolicitud,
    required this.id,
    required this.idBeneficiario,
    // required this.no_akz,
    // required this.iban,
  }) : super(key: key);

  final BeneficiariosController controller;
  final int index;
  final Color color;
  final String estado;
  final int idSolicitud;
  final int id;
  final int idBeneficiario;
  // final String no_akz;
  // final String iban;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: Get.size.height * 0.25,
                width: Get.size.width * 0.03,
                //color: color,
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                )),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.date_range_rounded, size: 25),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            controller.data[index].fecha!.day.toString() +
                                '/' +
                                controller.data[index].fecha!.month.toString() +
                                '/' +
                                controller.data[index].fecha!.year.toString(),
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            (controller.data[index].solicitudBeneficiario! ==
                                    null)
                                ? ""
                                : 'Beneficiario: ' +
                                    controller
                                        .data[index]
                                        .solicitudBeneficiario!
                                        .beneficiario!
                                        .nombre1! +
                                    ' ' +
                                    controller
                                        .data[index]
                                        .solicitudBeneficiario!
                                        .beneficiario!
                                        .apellido1!,
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            (controller.data[index].solicitudBeneficiario! ==
                                    null)
                                ? ""
                                : 'C.I: ' +
                                    controller
                                        .data[index]
                                        .solicitudBeneficiario!
                                        .beneficiario!
                                        .ci!,
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                            (controller.data[index].solicitudBeneficiario! ==
                                    null)
                                ? ""
                                : 'Sucursal: ' +
                                    controller
                                        .data[index]
                                        .solicitudBeneficiario!
                                        .beneficiario!
                                        .sucursal!
                                        .banco!,
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )),
            Container(
              height: Get.size.height * 0.25,
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (estado == "Enviada")
                        ? Visibility(
                            visible: true,
                            child: popupMenuButton(context, controller,
                                idSolicitud, id, index, idBeneficiario))
                        : Visibility(
                            visible: false,
                            child: Icon(Icons.more_vert, size: 25),
                          ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(estado,
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

Future<dynamic> showModalBottomEditar(BuildContext context,
    BeneficiariosController controller, int idBeneficiario) {
  String? provincia;
  String? municipio;
  String? sucursales;

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
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "EDITAR BENEFICIARIO",
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
                                    //initialValue: nombre,
                                    controller: controller.nombreEditController,
                                    onSaved: (value) {
                                      controller.nombre = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateNombre(value!);
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
                                    keyboardType: TextInputType.visiblePassword,
                                    controller:
                                        controller.apellidosEditController,
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
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controller.ciEditController,
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
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controller.cuentaEditController,
                                    onSaved: (value) {
                                      controller.cuenta = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateCuenta(value!);
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
                                    keyboardType: TextInputType.visiblePassword,
                                    controller:
                                        controller.tarjetaEditController,
                                    onSaved: (value) {
                                      controller.tarjeta = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateTarjeta(value!);
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
                                  value: controller.provinciaEdit,
                                  items: controller.listaprovincias
                                      .map(buildMenuItem)
                                      .toList(),
                                  // icon: Icon(
                                  //   Icons.arrow_drop_down,
                                  //   color: Colors.black,
                                  //   size: 20,
                                  // ),
                                  onChanged: (value) => setState(() {
                                    provincia = value.toString();
                                    municipio = null;
                                    sucursales = null;
                                    //controller.listaMunicipios.clear();
                                    controller.fetchMunicipios(controller
                                        .obtenerIdProvincia(value.toString()));
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
                                  () => (controller.isLoadingMunicipio.value ==
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
                                            municipio = value.toString();
                                            sucursales = null;
                                            controller.fetchSucursales(
                                                controller.obtenerIdMunicipio(
                                                    value.toString()));
                                          }),
                                          decoration: InputDecoration(
                                            labelText: "Municipio",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kColorApp),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kColorApp),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                              sucursales = value.toString()),
                                          decoration: InputDecoration(
                                            labelText: "Sucursales",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kColorApp),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kColorApp),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
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
                                        textStyle: GoogleFonts.robotoCondensed(
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
                                          controller.editar(
                                              idBeneficiario,
                                              provincia!,
                                              municipio!,
                                              sucursales!);
                                          Navigator.pop(context);

                                          // controller.insertar();
                                          // controller.ibanController.clear();
                                          // controller.noCuentaController.clear();
                                        },
                                        color: kColorApp,
                                        textStyle: GoogleFonts.robotoCondensed(
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

Widget popupMenuButton(BuildContext context, BeneficiariosController controller,
    int idSolicitud, int id, int index, int idBeneficiario) {
  return PopupMenuButton(
      child: Container(
        child: Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
      onSelected: (result) {
        if (result == 0) {
          controller.showDataEditar(index);
          showModalBottomEditar(context, controller, idBeneficiario);
        }
        if (result == 1) {
          Dialogs.materialDialog(
              context: context,
              msg: 'Desea elimar la solicitud',
              title: 'Delete',
              color: Colors.white,
              actions: [
                IconsOutlineButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconData: Icons.cancel_outlined,
                    textStyle: GoogleFonts.robotoCondensed(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    iconColor: Colors.grey,
                    text: 'Cancel'),
                IconsButton(
                    onPressed: () {
                      Navigator.pop(context);
                      controller.delete(id);
                    },
                    iconData: Icons.delete,
                    color: kColorApp,
                    textStyle: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    iconColor: Colors.white,
                    text: 'Aceptar'),
              ]);
        }
      },
      itemBuilder: (context) {
        var list = <PopupMenuEntry<Object>>[];
        list.add(PopupMenuItem(
          child: Text(
            'Editar',
            style: GoogleFonts.robotoCondensed(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          value: 0,
        ));
        list.add(PopupMenuDivider());
        list.add(
          PopupMenuItem(
            child: Text(
              'Eliminar',
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            value: 1,
          ),
        );
        return list;
      });
}
