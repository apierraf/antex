import 'package:antex/pages/cuenta_akz_iban/widgets/cuenta_item.dart';
import 'package:antex/pages/estipendios/estipendios_controller.dart';
import 'package:antex/pages/estipendios/widgets/estipendios_item.dart';
import 'package:antex/pages/estipendios/widgets/loading_data_estipendios.dart';
import 'package:antex/pages/estipendios/widgets/no_data_estipendios.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../widgets/app_bar.dart';

class EstipendiosPage extends StatelessWidget {
  //const EstipendiosPage({Key? key}) : super(key: key);

  final EstipendiosController controller = Get.put(EstipendiosController());

  String estado = "";
  Color color = Colors.black;

  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarPage(
                title: 'ESTIPENDIOS',
                buscar: IconButton(
                    onPressed: () {
                      Get.toNamed('estipendios_buscar');
                    },
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
                  ? LoadingEstipendios()
                  : (controller.data.isEmpty)
                      ? NoDataEstipendios()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            if (controller.data[index].estado!.estado! == 'N') {
                              estado = 'Enviada';
                              color = azul;
                            }
                            if (controller.data[index].estado!.estado! == 'P') {
                              estado = 'En proceso';
                              color = amarillo;
                            }
                            if (controller.data[index].estado!.estado! == 'C') {
                              estado = 'Confirmado';
                              color = verde;
                            }
                            if (controller.data[index].estado!.estado! == 'D') {
                              estado = 'Denegado';
                              color = kColorApp;
                            }
                            return EstipendiosItem(
                                controller: controller,
                                index: index,
                                color: color,
                                estado: estado,
                                idSolicitud: controller.data[index]
                                    .solicitudEstipendio!.idSolicitud!,
                                id: controller
                                    .data[index].solicitudEstipendio!.id!,
                                value: controller
                                    .data[index].solicitudEstipendio!.valor!);
                          }))
            ],
          ),
        ),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //openDialog(context);
            showModalBottomInsertar(context);
          },
          backgroundColor: kColorApp,
          child: Icon(Icons.add)),
    );
  }

  Future<dynamic> showModalBottomInsertar(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "SOLICITAR CAMBIO DE ESTIPENDIO",
                      style: GoogleFonts.robotoCondensed(
                          color: kColorApp,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                    ),
                    child: Container(
                      width: Get.size.width * 0.8,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
                          value: value,
                          items: controller.listaMontos
                              .map(buildMenuItem)
                              .toList(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                            size: 25,
                          ),
                          onChanged: (value) =>
                              setState(() => this.value = value.toString()),
                          decoration: InputDecoration(
                            fillColor: kColorApp,
                            focusColor: kColorApp,
                            hoverColor: kColorApp,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          //controller.valueEstipendio.value = value.toString();

                          //value: controller.valueEstipendio.value,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: context.width * 0.4),
                        child: IconsOutlineButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconData: Icons.cancel_outlined,
                            textStyle: GoogleFonts.robotoCondensed(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                            iconColor: Colors.grey,
                            text: 'Cancel'),
                      ),
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: context.width * 0.4),
                        child: Obx(() => ElevatedButton.icon(
                            onPressed: () {
                              (controller.isLoadingPost.value == true)
                                  ? null
                                  : controller.insertar(value!);

                              Navigator.pop(context);
                            },
                            label: const Text('Aceptar'),
                            icon: (controller.isLoadingPost.value == true)
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Container(),
                            style: ElevatedButton.styleFrom(
                              primary: kColorApp,
                              shape: (RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                              textStyle: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            );
          });
        });
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("SOLICITAR CAMBIO DE ESTIPENDIO"),
          content: StatefulBuilder(
            builder: ((context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        value: value,
                        items:
                            controller.listaMontos.map(buildMenuItem).toList(),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 25,
                        ),
                        onChanged: (value) =>
                            setState(() => this.value = value.toString()),
                        //controller.valueEstipendio.value = value.toString();

                        //value: controller.valueEstipendio.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(),
                ],
              );
            }),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  //controller.insertarCantidad();
                  Get.back();
                },
                child: Text("Aceptar"))
          ],
        ),
      );

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
}
