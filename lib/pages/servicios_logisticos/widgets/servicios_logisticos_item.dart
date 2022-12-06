import 'package:antex/pages/servicios_logisticos/servicios_logisticos_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiciosLogisticosItem extends StatelessWidget {
  ServiciosLogisticosItem({
    Key? key,
    required this.index,
    required this.controller,
    required this.color,
    required this.estado,
    required this.tipoSolicitud,
    required this.idSolicitud,
    required this.id,
  }) : super(key: key);

  final ServiciosLogisticosController controller;
  final int index;
  final Color color;
  final String estado;
  final String tipoSolicitud;
  final int idSolicitud;
  final int id;

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text((tipoSolicitud != 'S') ? "Transporte" : "Servicios",
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(estado,
                          style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ],
                  ),
                )
              ],
            )),
          ],
        )),
      ),
    );
  }
}
