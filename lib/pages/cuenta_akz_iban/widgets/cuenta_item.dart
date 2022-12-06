import 'package:antex/pages/cuenta_akz_iban/cuenta_akz_iban_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class CuentasItem extends StatelessWidget {
  const CuentasItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.color,
    required this.estado,
    required this.idSolicitud,
    required this.id,
    required this.no_akz,
    required this.iban,
  }) : super(key: key);

  final CuentaAKZIbanController controller;
  final int index;
  final Color color;
  final String estado;
  final int idSolicitud;
  final int id;
  final String no_akz;
  final String iban;

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
                height: Get.size.height * 0.15,
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
                            'No. de cuenta: ' +
                                controller.data[index].solicitudIban!.noAkz!,
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
                        child: Text('IBAN',
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
              height: Get.size.height * 0.15,
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
                                idSolicitud, id, no_akz, iban, index))
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

Future<dynamic> showModalBottomEditar(
    BuildContext context,
    CuentaAKZIbanController controller,
    int id,
    String no_akz,
    String iban,
    int index) {
  controller.noCuentaEditController.text = no_akz;
  controller.ibanEditController.text = iban;
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                    key: controller.formKeyCuentas,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Text(
                            "CAMBIO DE CUENTA EN AKZ e IBAN",
                            style: GoogleFonts.robotoCondensed(
                                color: kColorApp,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 25, right: 25, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Fecha Estipendio:",
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                  controller.data[index].fecha!.day.toString() +
                                      '/' +
                                      controller.data[index].fecha!.month
                                          .toString() +
                                      '/' +
                                      controller.data[index].fecha!.year
                                          .toString(),
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
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
                                    borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kColorApp),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kColorApp),
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "No. de cuenta AKZ",
                                suffixIcon: Icon(CupertinoIcons.pencil),
                              ),
                              keyboardType: TextInputType.name,
                              controller: controller.noCuentaEditController,
                              onSaved: (value) {
                                controller.noCuentaEdit = value!;
                              },
                              validator: (value) {
                                return controller.validateNoCuenta(value!);
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
                                    borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kColorApp),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kColorApp),
                                    borderRadius: BorderRadius.circular(20)),
                                labelText: "IBAN",
                                suffixIcon: Icon(CupertinoIcons.pencil),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                              controller: controller.ibanEditController,
                              onSaved: (value) {
                                controller.ibanEdit = value!;
                              },
                              validator: (value) {
                                return controller.validateIban(value!);
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    Navigator.pop(context);
                                    controller.editar(id);
                                    controller.ibanController.clear();
                                    controller.noCuentaController.clear();
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
          ),
        );
      });
}

Widget popupMenuButton(BuildContext context, CuentaAKZIbanController controller,
    int idSolicitud, int id, String no_akz, String iban, int index) {
  return PopupMenuButton(
      child: Container(
        child: Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
      onSelected: (result) {
        if (result == 0) {
          showModalBottomEditar(context, controller, id, no_akz, iban, index);
        }
        if (result == 1) {
          Dialogs.materialDialog(
              context: context,
              msg: 'Desea elimar la solicitud',
              title: 'Eliminar',
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
                      controller.delete(idSolicitud);
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
