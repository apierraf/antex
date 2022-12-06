import 'package:antex/pages/estipendios/estipendios_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class EstipendiosItem extends StatelessWidget {
  EstipendiosItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.color,
    required this.estado,
    required this.idSolicitud,
    required this.id,
    required this.value,
  }) : super(key: key);

  final EstipendiosController controller;
  final int index;
  final Color color;
  final String estado;
  final int idSolicitud;
  final int id;
  final String value;

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
                height: Get.size.height * 0.12,
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
                      Icon(Icons.monetization_on_outlined, size: 25),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                            double.parse(controller
                                    .data[index].solicitudEstipendio!.valor!)
                                .toStringAsFixed(2),
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            )),
            Container(
              height: Get.size.height * 0.12,
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
                                idSolicitud, id, value, index))
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

Widget popupMenuButton(BuildContext context, EstipendiosController controller,
    int idSolicitud, int id, String value, int index) {
  return PopupMenuButton(
      child: Container(
        child: Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
      ),
      onSelected: (result) {
        if (result == 0) {
          showModalBottomEditar(context, controller, id, value, index);
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

Future<dynamic> showModalBottomEditar(BuildContext context,
    EstipendiosController controller, int id, String value, int index) {
  String? valueEdit;
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "SOLICITAR CAMBIO DE ESTIPENDIO",
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
                  padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
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
                              controller.data[index].fecha!.month.toString() +
                              '/' +
                              controller.data[index].fecha!.year.toString(),
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
                  child: Container(
                    width: Get.size.width * 0.8,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        value: value,
                        items:
                            controller.listaMontos.map(buildMenuItem).toList(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 25,
                        ),
                        onChanged: (value) =>
                            setState(() => valueEdit = value.toString()),
                        decoration: InputDecoration(
                          fillColor: kColorApp,
                          focusColor: kColorApp,
                          hoverColor: kColorApp,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        //controller.valueEstipendio.value = value.toString();

                        //value: controller.valueEstipendio.value,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width * 0.4),
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
                      constraints:
                          BoxConstraints.tightFor(width: context.width * 0.4),
                      child: IconsButton(
                          onPressed: () {
                            Navigator.pop(context);
                            controller.editar(id, valueEdit!);
                            //controller.ibanController.clear();
                            //controller.noCuentaController.clear();
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
            ),
          );
        });
      });
}

DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(value: item, child: Text(item));
