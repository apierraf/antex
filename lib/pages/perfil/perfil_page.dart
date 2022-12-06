import 'package:antex/pages/perfil/perfil_controller.dart';
import 'package:antex/pages/perfil/widgets/loading_perfil_page.dart';
import 'package:antex/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';

class PerfilPage extends StatelessWidget {
  //const PerfilPage({Key? key}) : super(key: key);

  final PerfilController controller = Get.put(PerfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Obx(
            () => (controller.isLoading.isTrue)
                ? LoadingPerfilPage()
                : Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: Get.size.width,
                            height: Get.size.height * 0.315,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20),
                                    child: Image.asset(
                                        "assets/logo_antex_interior.png",
                                        width: Get.size.width * 0.4),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.size.height * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
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
                                  'PERFIL',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Positioned.fill(
                              bottom: 0,
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: CachedNetworkImageProvider(
                                              controller
                                                  .perfil.value.pathImagen!),
                                        )),
                                  )))
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.01,
                      ),
                      Text(
                        controller.perfil.value.nombreCompleto!,
                        style: GoogleFonts.robotoCondensed(
                            color: kColorApp,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: Get.size.height * 0.02,
                      ),
                      Text(
                        'No. Expendiente: ${controller.perfil.value.expediente}',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Correo: ${controller.perfil.value.email}',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Fecha de registro: ${controller.perfil.value.fechaRegistro!.day}/${controller.perfil.value.fechaRegistro!.month}/${controller.perfil.value.fechaRegistro!.year}',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      /*Text(
                        'Fecha de activación: ${controller.perfil.value.fechaActivacion!.day} / ${controller.perfil.value.fechaActivacion!.month} / ${controller.perfil.value.fechaActivacion!.year}',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),*/
                      SizedBox(
                        height: Get.size.height * 0.02,
                      ),
                      TextButton(
                          onPressed: () {
                            showModalBottomInsertar(context, controller);
                          },
                          child: Text(
                            'Cambiar Contraseña',
                            style: GoogleFonts.robotoCondensed(
                                color: kColorApp,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          )),
                      SizedBox(
                        height: Get.size.height * 0.02,
                      ),
                      Container(
                          width: Get.size.width * 0.8,
                          child: Form(
                            key: controller.formKey1,
                            child: Column(
                              children: [
                                Text(
                                  'Testimonio',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      suffixIcon: Icon(CupertinoIcons.pencil),
                                    ),
                                    keyboardType: TextInputType.name,
                                    controller: controller.testimonioController,
                                    onSaved: (value) {
                                      controller.testimonio = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validateTestimonio(value!);
                                    }),
                                SizedBox(
                                  height: Get.size.height * 0.01,
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: context.width * 0.5),
                                  child: Obx(
                                    () => ElevatedButton.icon(
                                        onPressed: () {
                                          (controller.isLoadingTestimonio
                                                      .value ==
                                                  true)
                                              ? null
                                              : {
                                                  controller
                                                      .insertarTestimonio(),
                                                  controller
                                                      .testimonioController
                                                      .clear(),
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus()
                                                };
                                        },
                                        icon: (controller.isLoadingTestimonio
                                                    .value ==
                                                true)
                                            ? Container(
                                                width: 24,
                                                height: 24,
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child:
                                                    const CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              )
                                            : Container(),
                                        label: const Text('ENVIAR'),
                                        style: ElevatedButton.styleFrom(
                                          primary: kColorApp,
                                          shape: (RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                          textStyle:
                                              GoogleFonts.robotoCondensed(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
          ),
        )));
  }
}

Future<dynamic> showModalBottomInsertar(
    BuildContext context, PerfilController controller) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Form(
                key: controller.formKeyCambioContrasena,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "CAMBIAR CONTRASEÑA",
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
                            labelText: "CONTRASEÑA ACTUAL",
                            suffixIcon: Icon(CupertinoIcons.pencil),
                          ),
                          keyboardType: TextInputType.name,
                          controller: controller.actualController,
                          onSaved: (value) {
                            controller.actual = value!;
                          },
                          validator: (value) {
                            return controller.validateActual(value!);
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
                            labelText: "NUEVA CONTRASEÑA",
                            suffixIcon: Icon(CupertinoIcons.pencil),
                          ),
                          keyboardType: TextInputType.name,
                          controller: controller.contrasenaController,
                          onSaved: (value) {
                            controller.contrasena = value!;
                          },
                          validator: (value) {
                            return controller.validateContrasena(value!);
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
                            labelText: "CONFIRMAR CONTRASEÑA",
                            suffixIcon: Icon(CupertinoIcons.pencil),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.nuevacontrasenaController,
                          onSaved: (value) {
                            controller.nuevacontrasena = value!;
                          },
                          validator: (value) {
                            return controller.validateNuevaContrasena(value!);
                          }),
                    ),
                    SizedBox(
                      height: 20,
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
                                controller.actualController.clear();
                                controller.contrasenaController.clear();
                                controller.nuevacontrasenaController.clear();
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
                ),
              ),
            ),
          );
        });
      });
}
