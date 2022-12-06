import 'package:antex/utils/colors.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_bar.dart';

class DetailsNoticia extends StatelessWidget {
  const DetailsNoticia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagen = Get.arguments['imagen'].replaceAll(r'\', r'/');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(children: [
          AppBarPage(
            title: 'NOTICIAS',
            buscar: Visibility(
              visible: false,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.search, color: Colors.white)),
            ),
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
          SizedBox(
            height: Get.size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              '${Get.arguments['titulo']}',
              textAlign: TextAlign.justify,
              style:
                  GoogleFonts.robotoCondensed(color: kColorApp, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${Get.arguments['dia']} de ${Get.arguments['mes']} del ${Get.arguments['ano']}',
                  style: GoogleFonts.robotoCondensed(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Badge(
                    badgeColor: kColorApp,
                    elevation: 3,
                    position: BadgePosition.topEnd(end: -3),
                    badgeContent: Text(
                      '${Get.arguments['comentario']}',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.mode_comment_outlined,
                            size: 30, color: kColorApp)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: CachedNetworkImage(
                width: Get.size.width,
                height: Get.size.height * 0.3,
                imageUrl: '${imagen}',
                fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              '${Get.arguments['resumen']}',
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          )
        ])),
      ),
    );
  }
}
