import 'package:antex/pages/notificaciones/notificaciones_controller.dart';
import 'package:antex/pages/notificaciones/widgets/no_data_notifications.dart';
import 'package:antex/pages/notificaciones/widgets/notificaciones_item.dart';
import 'package:antex/pages/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../vuelos/widgets/loading_vuelos_page.dart';

class NotificacionesPage extends StatelessWidget {
  NotificacionesPage({Key? key}) : super(key: key);

  final NotificacionesController controller =
      Get.put(NotificacionesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
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
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: IconButton(
                                onPressed: () {
                                  Get.toNamed('/perfil');
                                },
                                icon: Icon(CupertinoIcons.person_alt,
                                    color: Colors.white)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ),
                                onSelected: (result) {
                                  if (result == 0) {
                                    Get.toNamed('/acercade');
                                  }
                                },
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text('Acerca de'),
                                        value: 0,
                                      )
                                    ]),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.size.height * 0.07,
                  ),
                  Text(
                    'NOTIFICACIONES',
                    style: GoogleFonts.robotoCondensed(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Get.size.height * 0.01,
          ),
          Obx(() => (controller.isLoading.value == true)
              ? LoadingVuelos()
              : (controller.notificaciones.value.data!.notificaciones!
                      .notificaciones!.isEmpty)
                  ? NoDataNotificaciones()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.notificaciones.value.data!
                          .notificaciones!.notificaciones!.length,
                      itemBuilder: (context, index) {
                        return NotificacionesItem(
                          controller: controller,
                          index: index,
                        );
                      }))
        ],
      ),
    ));
  }
}
