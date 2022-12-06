import 'package:antex/pages/noticias/comentarios/comentarios_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ComentarioItem extends StatelessWidget {
  ComentarioItem({Key? key, required this.controller, required this.index})
      : super(key: key);

  final ComentariosController controller;
  final int index;

  List months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text(
                  controller.data[index].nombreAutor! + " comentó:",
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text(
                  controller.data[index].comentario!,
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Text(
                  controller.data[index].createdAt!.day.toString() +
                      " de " +
                      months[controller.data[index].createdAt!.month - 1] +
                      " del " +
                      controller.data[index].createdAt!.year.toString(),
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  height: 2,
                  width: Get.size.width,
                  color: kColorApp,
                ),
              ),
            ],
          ),
        ));
  }
}
