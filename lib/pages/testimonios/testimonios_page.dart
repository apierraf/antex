import 'package:antex/pages/testimonios/testimonios_controller.dart';
import 'package:antex/pages/testimonios/widgets/loading_testimonios.dart';
import 'package:antex/pages/testimonios/widgets/no_data_testimonios.dart';
import 'package:antex/pages/testimonios/widgets/testimonios_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar.dart';

class TestimoniosPage extends StatelessWidget {
  //const TestimoniosPage({Key? key}) : super(key: key);

  final TestimoniosController controller = Get.put(TestimoniosController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              AppBarPage(
                title: 'TESTIMONIOS',
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
                  ? LoadingTestimonios()
                  : (controller.data.isEmpty)
                      ? NoDataTestimonios()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return TestimoniosItem(
                              controller: controller,
                              index: index,
                            );
                          }))
            ],
          ),
        ));
  }
}
