import 'package:antex/utils/colors.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../noticias_controller.dart';

class NoticiasItem extends StatelessWidget {
  NoticiasItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final NoticiasController controller;
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
    final imagen = controller.data[index].pathImagen!.replaceAll(r'\', r'/');

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Card(
          elevation: 5,
          child: Container(
            height: Get.size.height * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: double.infinity,
                          child: CachedNetworkImage(
                              width: Get.size.width,
                              //height: Get.size.height * 0.3,
                              imageUrl: imagen,
                              fit: BoxFit.fill),
                        ),
                        Positioned.fill(
                          bottom: 0,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(15),
                                color: black_05.withOpacity(0.5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 5, bottom: 5, right: 10),
                                    child: Text(
                                      controller.data[index].createdAt!.day
                                          .toString(),
                                      style: GoogleFonts.robotoCondensed(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          controller.data[index].createdAt!.year
                                              .toString(),
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          months[controller.data[index]
                                                  .createdAt!.month -
                                              1],
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Badge(
                                      badgeColor: kColorApp,
                                      elevation: 3,
                                      position: BadgePosition.topEnd(end: -3),
                                      badgeContent: Text(
                                        controller.data[index].comentarios!
                                            .toString(),
                                        style: GoogleFonts.robotoCondensed(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      child: InkWell(
                                          onTap: () {
                                            Get.toNamed('/comentarios',
                                                arguments: {
                                                  'idNoticia':
                                                      controller.data[index].id,
                                                });
                                          },
                                          child: Icon(
                                              Icons.mode_comment_outlined,
                                              size: 30,
                                              color: Colors.white)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
                  child: Text(
                    controller.data[index].categoria!,
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15, top: 10),
                  child: Text(
                    controller.data[index].titulo!,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.robotoCondensed(
                        color: kColorApp,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 15, top: 10, bottom: 10),
                  child: Text(
                    controller.data[index].resumen!,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: 16,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
