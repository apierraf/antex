import 'package:antex/pages/vuelos/vuelos_controller.dart';
import 'package:antex/pages/vuelos/widgets/loading_vuelos_page.dart';
import 'package:antex/pages/vuelos/widgets/no_data_vuelos.dart';
import 'package:antex/pages/vuelos/widgets/vuelos_item.dart';
import 'package:antex/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/app_bar.dart';

class VuelosPage extends StatelessWidget {
  //const VuelosPage({Key? key}) : super(key: key);

  final VuelosController controller = Get.put(VuelosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBarPage(
              title: 'VUELOS',
              buscar: IconButton(
                  onPressed: () {
                    Get.toNamed('vuelos_buscar');
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
              height: Get.size.height * 0.03,
            ),
            Obx(() => (controller.isLoading.value == true)
                ? LoadingVuelos()
                : (controller.data.isEmpty)
                    ? NoDataVuelo()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return VuelosItem(
                            controller: controller,
                            index: index,
                          );
                        }))
          ],
        ),
      ),
    ));
  }
}
