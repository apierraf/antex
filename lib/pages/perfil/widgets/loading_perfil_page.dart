import 'package:antex/pages/widgets/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingPerfilPage extends StatelessWidget {
  //const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: Get.size.width,
              height: Get.size.height * 0.315,
              color: Colors.white,
            ),
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
                  ],
                ),
                SizedBox(
                  height: Get.size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 3),
                  child: IconButton(
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
                Center(
                  child: Text(
                    'PERFIL',
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Positioned.fill(
                bottom: 0,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ShimmerWidget.circular(
                      width: 100,
                      height: 100,
                    )))
          ],
        ),
        SizedBox(
          height: Get.size.height * 0.01,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.04,
          width: Get.size.width * 0.7,
        ),
        SizedBox(
          height: Get.size.height * 0.01,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.03,
          width: Get.size.width * 0.5,
        ),
        SizedBox(
          height: 2,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.03,
          width: Get.size.width * 0.5,
        ),
        SizedBox(
          height: 2,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.03,
          width: Get.size.width * 0.5,
        ),
        SizedBox(
          height: 2,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.03,
          width: Get.size.width * 0.5,
        ),
        SizedBox(
          height: Get.size.height * 0.02,
        ),
        ShimmerWidget.rectangle(
          height: Get.size.height * 0.04,
          width: Get.size.width * 0.4,
        ),
        SizedBox(
          height: Get.size.height * 0.02,
        ),
        Container(
            width: Get.size.width * 0.8,
            child: Column(
              children: [
                ShimmerWidget.rectangle(
                  height: Get.size.height * 0.04,
                  width: Get.size.width * 0.5,
                ),
                SizedBox(
                  height: 2,
                ),
                ShimmerWidget.circular(
                  width: Get.size.width * 0.85,
                  height: Get.size.height * 0.15,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: Get.size.height * 0.01,
                ),
                ShimmerWidget.circular(
                  width: Get.size.width * 0.5,
                  height: Get.size.height * 0.04,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ))
      ],
    );
  }
}
