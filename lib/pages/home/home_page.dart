import 'package:antex/pages/home/home_controller.dart';
import 'package:antex/pages/home/widgets/loading_home_page.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  double valor = 100000.0;

  static final getStorage = GetStorage();
  static final storageKeyAngola = 'angola';

  static var angola = getStorage.read(storageKeyAngola);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Obx(() => (controller.isLoading.isTrue)
                ? LoadingHomePage()
                : Column(children: [
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
                                  image:
                                      AssetImage("assets/image_interior.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 20),
                                  child: Image.asset(
                                      "assets/logo_antex_interior.png",
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
                                            if (result == 1) {
                                              Get.toNamed('/contactenos');
                                            }
                                          },
                                          itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  child: Text('Acerca de'),
                                                  value: 0,
                                                ),
                                                PopupMenuItem(
                                                  child: Text('Contáctenos'),
                                                  value: 1,
                                                )
                                              ]),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.size.height * 0.04,
                            ),
                            Text(
                              'Aereolínea: ' +
                                  controller
                                      .vueloProximo.value.data!.aerolinea!,
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 22,
                                  decoration: TextDecoration.underline),
                            )
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
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: Text(
                                                    'FECHA',
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                  ))),
                                              Expanded(
                                                child: Text(
                                                  controller.vueloProximo.value
                                                          .data!.fecha!.day
                                                          .toString() +
                                                      '/' +
                                                      controller
                                                          .vueloProximo
                                                          .value
                                                          .data!
                                                          .fecha!
                                                          .month
                                                          .toString() +
                                                      '/' +
                                                      controller
                                                          .vueloProximo
                                                          .value
                                                          .data!
                                                          .fecha!
                                                          .year
                                                          .toString(),
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.25,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: Text(
                                                    'MOTIVO',
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                  ))),
                                              Expanded(
                                                child: Text(
                                                  controller.vueloProximo.value
                                                      .data!.motivo!,
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      elevation: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: Get.size.width * 0.2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: Center(
                                                      child: Text(
                                                    'DESTINO',
                                                    style: GoogleFonts
                                                        .robotoCondensed(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline),
                                                  ))),
                                              Expanded(
                                                child: Text(
                                                  controller.vueloProximo.value
                                                          .data!.salidaCuba!
                                                      ? 'Angola'
                                                      : 'Cuba',
                                                  style: GoogleFonts
                                                      .robotoCondensed(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: Obx((() =>
                          controller.solicitudesServiciosVacias.value == true
                              ? Container()
                              : Container(
                                  width: Get.size.width * 0.85,
                                  height: Get.size.height * 0.06,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.free_breakfast_outlined,
                                        size: 30,
                                        color: controller
                                                .vueloProximo
                                                .value
                                                .data!
                                                .solicitudesServicio![0]
                                                .desayuno!
                                            ? kColorAngola
                                            : kColorApp,
                                      ),
                                      Icon(
                                        Icons.fastfood_outlined,
                                        size: 30,
                                        color: controller
                                                .vueloProximo
                                                .value
                                                .data!
                                                .solicitudesServicio![0]
                                                .almuerzo!
                                            ? kColorAngola
                                            : kColorApp,
                                      ),
                                      Icon(
                                        Icons.restaurant_outlined,
                                        size: 30,
                                        color: controller
                                                .vueloProximo
                                                .value
                                                .data!
                                                .solicitudesServicio![0]
                                                .cena!
                                            ? kColorAngola
                                            : kColorApp,
                                      ),
                                      Icon(
                                        Icons.hotel_outlined,
                                        size: 30,
                                        color: controller
                                                .vueloProximo
                                                .value
                                                .data!
                                                .solicitudesServicio![0]
                                                .alojamiento!
                                            ? kColorAngola
                                            : kColorApp,
                                      ),
                                      Icon(
                                        Icons.directions_bus_outlined,
                                        size: 30,
                                        color: controller
                                                    .vueloProximo
                                                    .value
                                                    .data!
                                                    .solicitudTransporte! ==
                                                null
                                            ? kColorAngola
                                            : kColorApp,
                                      )
                                    ],
                                  ),
                                ))),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.03,
                    ),
                    Text(
                      'Nómina',
                      style: GoogleFonts.robotoCondensed(
                          color: kColorApp,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: Container(
                        width: Get.size.width * 0.85,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ingreso Total (mes):',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.nomina.value.data!.isEmpty)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller.nomina
                                                      .value.data![0].ingreso!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Salario Angola:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.nomina.value.data!.isEmpty)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller
                                                      .nomina
                                                      .value
                                                      .data![0]
                                                      .cobroAngola!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Descuentos:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.nomina.value.data!.isEmpty)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller
                                                      .nomina
                                                      .value
                                                      .data![0]
                                                      .otrosDescuentos!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cuenta de Ahorro:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.nomina.value.data!.isEmpty)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller
                                                      .nomina
                                                      .value
                                                      .data![0]
                                                      .cuentaCuba!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fecha:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.nomina.value.data!.isEmpty)
                                          ? ""
                                          : parseDateAntex(
                                              controller
                                                  .nomina.value.data![0].mesAnno
                                                  .toString(),
                                            ),
                                      // : double.parse(
                                      //     controller.nomina.value.data![0]
                                      //         .mesAnno!,
                                      //   ).toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.03,
                    ),
                    Text(
                      'Cuenta Bancaria',
                      style: GoogleFonts.robotoCondensed(
                          color: kColorApp,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      child: Container(
                        width: Get.size.width * 0.85,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Acumulado:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.cuentaCuba.value.data!
                                                  .acumulado ==
                                              null)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller.cuentaCuba
                                                      .value.data!.acumulado!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Disponible:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.cuentaCuba.value.data!
                                                  .disponible ==
                                              null)
                                          ? "\$ 0.00"
                                          : '\$ ' +
                                              double.parse(controller.cuentaCuba
                                                      .value.data!.disponible!)
                                                  .toStringAsFixed(2),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Actualización:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.cuentaCuba.value.data!
                                                  .disponible ==
                                              null)
                                          ? ""
                                          : parseDateAct(
                                              controller.cuentaCuba.value.data!
                                                  .fechaAct
                                                  .toString(),
                                            ),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Más detalles:',
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      (controller.cuentaCuba.value.data!
                                                  .disponible !=
                                              null)
                                          ? "--sin historial --"
                                          : controller.cuentaCuba.value.data!
                                              .rutaFichero
                                              .toString(),
                                      style: GoogleFonts.robotoCondensed(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.03,
                    ),
                    Container(
                      width: Get.size.width,
                      color: kColorAngola,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (() {
                              var a = angola;
                              // Get.toNamed('/webview', arguments: {
                              //   'angola': a,
                              // });
                            }),
                            child: Text(
                              '¡Conozca Angola!',
                              style: GoogleFonts.robotoCondensed(
                                  color: kColorApp,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                            style: GoogleFonts.robotoCondensed(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: context.width * 0.5),
                            child: ElevatedButton(
                                onPressed: () {
                                  //Get.toNamed('/webview');
                                  var a = angola;
                                  Get.toNamed('/webview', arguments: {
                                    'angola': a,
                                  });
                                },
                                child: const Text('Descargar'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: kColorApp,
                                  textStyle: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.05,
                    ),
                  ])),
          )),
    );
  }

  String parseDateAntex(String date) {
    var split1 = date.substring(0, 2);
    var split2 = date.substring(2, date.length);
    return '$split1.$split2';
  }

  String parseDateAct(String date) {
    final DateTime dateAct = DateTime.parse(date);
    String day = dateAct.day.toString();

    final DateFormat formatter = DateFormat.MMM();
    String month = formatter.format(dateAct);

    String year = dateAct.year.toString();

    return '${day}.${month}.${year}';
  }
}
