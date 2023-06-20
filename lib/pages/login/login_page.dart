import 'package:antex/pages/login/login_controller.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/splash.png"), fit: BoxFit.cover)),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: Get.size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset("assets/logo_antex.png"),
                  ),
                  SingleChildScrollView(
                    child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kColorApp),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kColorApp),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: "Usuario",
                                    suffixIcon: Icon(CupertinoIcons.pencil),
                                  ),
                                  keyboardType: TextInputType.name,
                                  controller: controller.usuarioController,
                                  onSaved: (value) {
                                    controller.usuario = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateUsuario(value!);
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Obx(
                                () => TextFormField(
                                    obscureText:
                                        !controller.passwordVisible.value,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kColorApp),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      labelText: "Contraseña",
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          controller.passwordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          controller.changeVisibility();
                                        },
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: controller.contrasenaController,
                                    onSaved: (value) {
                                      controller.contrasena = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validateContrasena(value!);
                                    }),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: context.width, height: 50),
                      child: Obx(
                        () => ElevatedButton.icon(
                            onPressed: () {
                              (controller.isLoading.value == true)
                                  ? null
                                  : {
                                      controller.login(),
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus()
                                    };
                            },
                            icon: (controller.isLoading.value == true)
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
                            label: const Text('ENTRAR'),
                            style: ElevatedButton.styleFrom(
                              primary: kColorApp,
                              shape: (RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                              textStyle: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
