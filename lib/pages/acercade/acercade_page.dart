import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class AcercadePage extends StatelessWidget {
  const AcercadePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/splash.png"), fit: BoxFit.cover)),
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                height: Get.size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset("assets/logo_antex.png"),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    Text(
                      'Versión 1.0',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    Text(
                      '© 2022 Desoft',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Todos los derechos reservados.',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                    Text(
                      'DESCRIPCIÓN',
                      style: GoogleFonts.robotoCondensed(
                          color: kColorApp,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )
                  ],
                )))
      ]),
    );
  }
}
