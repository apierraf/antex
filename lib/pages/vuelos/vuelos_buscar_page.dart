import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VuelosBuscarPage extends StatelessWidget {
  const VuelosBuscarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar'),
        bottom: PreferredSize(
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    //controller: controller.textSearch,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: kColorApp,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Criterio de busqueda',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: kColorApp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(width: 1, color: kColorApp),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //controller.searchPost();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size(Get.size.width, 50),
        ),
      ),
      body: Center(
        child: Lottie.asset(
          'assets/buscar.json',
        ),
      ),
    );
  }
}
