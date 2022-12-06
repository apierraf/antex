import 'package:antex/pages/cuenta_akz_iban/cuenta_akz_iban_controller.dart';
import 'package:antex/pages/cuenta_akz_iban/widgets/cuenta_item.dart';
import 'package:antex/pages/cuenta_akz_iban/widgets/loading_cuenta.dart';
import 'package:antex/pages/cuenta_akz_iban/widgets/no_data_cuenta_akz_iban.dart';
import 'package:antex/pages/vuelos/widgets/no_data_vuelos.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

import '../widgets/app_bar.dart';

class CuentaAKZIBANPage extends StatelessWidget {
  //const CuentaAKZIBANPage({Key? key}) : super(key: key);

  final CuentaAKZIbanController controller = Get.put(CuentaAKZIbanController());

  String estado = "";
  int? idSolicitud;
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarPage(
                title: 'CUENTA AKZ E IBAN',
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
                  ? LoadingCuenta()
                  : (controller.data.isEmpty)
                      ? NoDataCuentaAKZIBAN()
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
                            return CuentasItem(
                              controller: controller,
                              index: index,
                              color: color,
                              estado: estado,
                              idSolicitud: controller
                                  .data[index].solicitudIban!.idSolicitud!,
                              id: controller.data[index].solicitudIban!.id!,
                              no_akz:
                                  controller.data[index].solicitudIban!.noAkz!,
                              iban: controller.data[index].solicitudIban!.iban!,
                            );
                          }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kColorApp,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomInsert(context);
          }),
    );
  }

  Future<dynamic> showModalBottomInsert(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                      key: controller.formKeyCuentas,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "CAMBIO DE CUENTA EN AKZ e IBAN",
                              style: GoogleFonts.robotoCondensed(
                                  color: kColorApp,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25,
                              right: 25,
                            ),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kColorApp),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kColorApp),
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "No. de cuenta AKZ",
                                  suffixIcon: Icon(CupertinoIcons.pencil),
                                ),
                                keyboardType: TextInputType.name,
                                controller: controller.noCuentaController,
                                onSaved: (value) {
                                  controller.noCuenta = value!;
                                },
                                validator: (value) {
                                  return controller.validateNoCuenta(value!);
                                }),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25,
                              right: 25,
                            ),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kColorApp),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kColorApp),
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "IBAN",
                                  suffixIcon: Icon(CupertinoIcons.pencil),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                controller: controller.ibanController,
                                onSaved: (value) {
                                  controller.iban = value!;
                                },
                                validator: (value) {
                                  return controller.validateIban(value!);
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: context.width * 0.4),
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
                                constraints: BoxConstraints.tightFor(
                                    width: context.width * 0.4),
                                child: IconsButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      controller.insertar();
                                      controller.ibanController.clear();
                                      controller.noCuentaController.clear();
                                    },
                                    color: kColorApp,
                                    textStyle: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    iconColor: Colors.white,
                                    text: 'Aceptar'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }
}
