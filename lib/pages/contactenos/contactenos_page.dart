import 'package:antex/pages/contactenos/contactenos_controller.dart';
import 'package:antex/pages/vuelos/widgets/no_data_vuelos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../widgets/app_bar.dart';

class ContactenosPage extends StatelessWidget {
  //const ContactenosPage({Key? key}) : super(key: key);

  final ContactenosController controller = Get.put(ContactenosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Image.asset("assets/logo_antex_interior.png",
                          width: Get.size.width * 0.4),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 3),
                      child: IconButton(
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
                    Center(
                      child: Text(
                        'CONTÁCTENOS',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet.',
                      style: GoogleFonts.robotoCondensed(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                        key: controller.formKey2,
                        child: Column(
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: "Correo",
                                    suffixIcon: Icon(CupertinoIcons.mail)),
                                keyboardType: TextInputType.name,
                                controller: controller.correoController,
                                onSaved: (value) {
                                  controller.correo = value!;
                                },
                                validator: (value) {
                                  return controller.validateCorreo(value!);
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                maxLines: 6,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "Mensaje",
                                  suffixIcon: Icon(CupertinoIcons.pencil),
                                ),
                                controller: controller.mensajeController,
                                onSaved: (value) {
                                  controller.mensaje = value!;
                                },
                                validator: (value) {
                                  return controller.validateMensaje(value!);
                                }),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: context.width * 0.5),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('ENVIAR'),
                        style: ElevatedButton.styleFrom(
                          primary: kColorApp,
                          textStyle: GoogleFonts.robotoCondensed(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
