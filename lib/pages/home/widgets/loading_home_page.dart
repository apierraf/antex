import 'package:antex/pages/widgets/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingHomePage extends StatelessWidget {
  const LoadingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            width: Get.size.width,
            height: Get.size.height * 0.3,
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Image.asset("assets/logo_antex_interior.png",
                        width: Get.size.width * 0.4),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(CupertinoIcons.person_alt,
                              color: Colors.white)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert, color: Colors.white)),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: Get.size.height * 0.04,
              ),
              ShimmerWidget.rectangle(
                height: Get.size.height * 0.04,
                width: Get.size.width * 0.5,
              )
              /*Text(
                  'Aereolinea',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                )*/
            ],
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.size.height * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: ShimmerWidget.circular(
                          width: Get.size.width * 0.25,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: ShimmerWidget.circular(
                          width: Get.size.width * 0.25,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: ShimmerWidget.circular(
                          width: Get.size.width * 0.25,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: Get.size.height * 0.01,
      ),
      ShimmerWidget.circular(
        width: Get.size.width * 0.85,
        height: Get.size.height * 0.06,
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      SizedBox(
        height: Get.size.height * 0.04,
      ),
      ShimmerWidget.rectangle(
        height: Get.size.height * 0.04,
        width: Get.size.width * 0.5,
      ),
      SizedBox(
        height: Get.size.height * 0.01,
      ),
      ShimmerWidget.circular(
        width: Get.size.width * 0.85,
        height: Get.size.height * 0.15,
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      SizedBox(
        height: Get.size.height * 0.04,
      ),
      ShimmerWidget.rectangle(
        height: Get.size.height * 0.04,
        width: Get.size.width * 0.5,
      ),
      SizedBox(
        height: Get.size.height * 0.01,
      ),
      ShimmerWidget.circular(
        width: Get.size.width * 0.85,
        height: Get.size.height * 0.15,
        shapeBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ]);
  }
}
