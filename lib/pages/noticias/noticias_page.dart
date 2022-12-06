import 'package:antex/pages/noticias/noticias_controller.dart';
import 'package:antex/pages/noticias/widgets/noticias_item.dart';
import 'package:antex/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../vuelos/widgets/no_data_vuelos.dart';
import '../widgets/app_bar.dart';
import 'widgets/loading_noticias_page.dart';

class NoticiasPage extends StatelessWidget {
  //const NoticiasPage({Key? key}) : super(key: key);

  final NoticiasController controller = Get.put(NoticiasController());

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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarPage(
              title: 'NOTICIAS',
              buscar: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.search, color: Colors.white)),
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
                            onTap: () {
                              //DateFormat formatter = DateFormat('yyyy');
                              //DateFormat("MMMM").format(controller.data[index].createdAt!);
                              var mes = controller.data[index].createdAt!.month;
                              Get.toNamed('/details_noticias', arguments: {
                                'titulo': controller.data[index].titulo,
                                'dia': controller.data[index].createdAt!.day,
                                'mes': months[mes - 1],
                                'ano': controller.data[index].createdAt!.year,
                                'comentario':
                                    controller.data[index].comentarios,
                                'imagen': controller.data[index].pathImagen,
                                'resumen': controller.data[index].resumen,
                                'slug': controller.data[index].slug,
                              });
                            },
                            child: NoticiasItem(
                              controller: controller,
                              index: index,
                            ),
                          );
                        }))
          ],
        ),
      )),
    );
  }
}
