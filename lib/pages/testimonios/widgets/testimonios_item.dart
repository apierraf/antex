import 'package:antex/pages/testimonios/testimonios_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimoniosItem extends StatelessWidget {
  const TestimoniosItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final TestimoniosController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Container(
        height: 150,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
          ),
          Positioned.fill(
            left: 75,
            child: Container(
              height: 100,
              color: kCardInfoBG.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.only(left: 80),
                child: Center(
                  child: Text(
                    controller.data[index].testimonio!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            left: 0,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                            controller.data[index].imagenColaborador!)
                        /*AssetImage(
                        'assets/perfil.jpg',
                      ),*/
                        )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
