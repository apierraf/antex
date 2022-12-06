import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../notificaciones_controller.dart';

class NotificacionesItem extends StatelessWidget {
  const NotificacionesItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final NotificacionesController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      controller.notificaciones.value.data!.notificaciones!
                          .notificaciones![index].detalle!,
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          controller.notificaciones.value.data!.notificaciones!
                              .notificaciones![index].tipo!.descripcion!,
                          style: GoogleFonts.robotoCondensed(
                            color: kColorApp,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
