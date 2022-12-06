import 'package:antex/pages/servicios_logisticos/servicios_logisticos_controller.dart';
import 'package:antex/pages/servicios_logisticos/widgets/loading_servicios_logisticos.dart';
import 'package:antex/pages/servicios_logisticos/widgets/no_data_servicios.dart';
import 'package:antex/pages/servicios_logisticos/widgets/servicios_logisticos_item.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../widgets/app_bar.dart';

class ServiciosLogisticos extends StatelessWidget {
  //const ServiciosLogisticos({Key? key}) : super(key: key);

  final ServiciosLogisticosController controller =
      Get.put(ServiciosLogisticosController());

  String estado = "";
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: kColorApp,
          overlayColor: Colors.black,
          overlayOpacity: 0.4,
          spacing: 12,
          children: [
            SpeedDialChild(
                child: Icon(Icons.access_alarm),
                label: 'Servicios Alojamiento',
                onTap: () {
                  Get.toNamed('/servicios_alojamiento_prueba');
                }),
            SpeedDialChild(
                child: Icon(Icons.access_alarm), label: 'Servicios Transporte'),
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                AppBarPage(
                  title: 'SERVICIOS LOGÍSTICOS',
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
                // SizedBox(
                //   height: Get.size.height * 0.05,
                // ),
                Obx(() => (controller.isLoading.value == true)
                    ? LoadingServiciosLogisticos()
                    : (controller.data.isEmpty)
                        ? NoDataServicios()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) {
                              if (controller.data[index].estado!.estado! ==
                                  'N') {
                                estado = 'Enviada';
                                color = azul;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'P') {
                                estado = 'En proceso';
                                color = amarillo;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'C') {
                                estado = 'Confirmado';
                                color = verde;
                              }
                              if (controller.data[index].estado!.estado! ==
                                  'D') {
                                estado = 'Denegado';
                                color = kColorApp;
                              }
                              if (controller.data[index].solicitudesServicio!
                                  .isNotEmpty) {
                                return ServiciosLogisticosItem(
                                  controller: controller,
                                  index: index,
                                  color: color,
                                  estado: estado,
                                  tipoSolicitud:
                                      controller.data[index].tipoSolicitud!,
                                  idSolicitud: controller.data[index]
                                      .solicitudesServicio![0].idSolicitud!,
                                  id: controller
                                      .data[index].solicitudesServicio![0].id!,
                                );
                              } else {
                                return Container();
                              }
                            }))
              ],
            ),
          ),
        ));
  }
}
