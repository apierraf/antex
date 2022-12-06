import 'package:antex/pages/noticias/comentarios/comentarios_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../vuelos/widgets/no_data_vuelos.dart';
import '../../widgets/app_bar.dart';
import '../noticias_controller.dart';
import '../widgets/loading_noticias_page.dart';
import 'comentario_item.dart';

class ComentariosPage extends StatelessWidget {
  //const ComentariosPage({Key? key}) : super(key: key);

  final ComentariosController controller =
      Get.put(ComentariosController(Get.arguments['idNoticia']));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppBarPage(
              title: 'COMENTARIOS',
              // buscar: IconButton(
              //     onPressed: () {},
              //     icon: Icon(CupertinoIcons.search, color: Colors.white)),
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
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: GoogleFonts.robotoCondensed(
                      color: kColorApp,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: const Text(
                  'COMENTAR',
                  style: TextStyle(
                    color: kColorApp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Obx(() => (controller.isLoading.value == true)
                ? LoadingNoticias()
                : (controller.data.isEmpty)
                    ? NoDataVuelo()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: ComentarioItem(
                              controller: controller,
                              index: index,
                            ),
                          );
                        }))
          ],
        ),
      ),
    ));
  }
}
