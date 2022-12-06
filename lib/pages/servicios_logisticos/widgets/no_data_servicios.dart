import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class NoDataServicios extends StatelessWidget {
  const NoDataServicios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset('assets/logisticos.json',
            height: Get.size.height * 0.4, width: Get.size.width),
        Text(
          '!No hay servicios¡',
          style: GoogleFonts.robotoCondensed(
              color: kColorApp, fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
