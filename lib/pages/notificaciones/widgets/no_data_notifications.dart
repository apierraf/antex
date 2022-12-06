import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/colors.dart';

class NoDataNotificaciones extends StatelessWidget {
  const NoDataNotificaciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Lottie.asset('assets/notifications.json',
            height: Get.size.height * 0.4),
        SizedBox(
          height: 20,
        ),
        Text(
          '!No hay notificaciones¡',
          style: GoogleFonts.robotoCondensed(
              color: kColorApp, fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
