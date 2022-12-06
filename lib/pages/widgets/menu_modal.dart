import 'dart:io';

import 'package:antex/pages/widgets/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../contrato_trabajo/contrato_trabajo_api.dart';

class MenuModal extends StatelessWidget {
  const MenuModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
            child: Text(
              'CONSULTAR',
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/vuelos');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.flight_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                title: Text(
                  'Vuelos',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: (() async {
              final getStorage = GetStorage();
              final storageKeyExpediente = 'expediente';

              var expediente = getStorage.read(storageKeyExpediente);

              String url = baseUrl + "conoce-angola/1";
              // final url =
              //     'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
              final file = await ContratoTrabajoApi.loadNetwork(url);
              openPDF(context, file);
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.work_outline_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Contrato de Trabajo',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              'MODIFICAR',
              style: GoogleFonts.robotoCondensed(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/estipendios');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.paid_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Estipendios',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/cuentas');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.credit_card_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Cuenta en AKZ e IBAN',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/beneficiario');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.person_pin_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Beneficiario',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/servicios');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.local_shipping_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Reservar servicios logísticos',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/preguntas');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  Icons.question_answer_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Preguntas Frecuentes',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pop(context);
          //     Get.toNamed('/encuestas');
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 30),
          //     child: ListTile(
          //       leading: Icon(
          //         Icons.list_alt_rounded,
          //         color: Colors.black,
          //         size: 30,
          //       ),
          //       title: Text(
          //         'Encuestas ',
          //         style: GoogleFonts.robotoCondensed(
          //           color: Colors.black,
          //           fontSize: 20,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/testimonios');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.person_3_fill,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Testimonios',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/noticias');
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.news_solid,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text(
                  'Noticias',
                  style: GoogleFonts.robotoCondensed(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void openPDF(BuildContext context, File file) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
    );
