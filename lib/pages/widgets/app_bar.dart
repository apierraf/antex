import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage(
      {Key? key, required this.title, this.buscar, required this.atras})
      : super(key: key);

  final String title;
  final Widget? buscar;
  final Widget atras;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.size.width,
          height: Get.size.height * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image_interior.png"),
                  fit: BoxFit.fill)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Image.asset("assets/logo_antex_interior.png",
                      width: Get.size.width * 0.4),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: buscar,
                )
              ],
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 3),
                child: atras),
            Center(
              child: Text(
                '$title',
                style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
