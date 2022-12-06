import 'package:antex/pages/beneficiario/widgets/no_data_beneficiario.dart';
import 'package:antex/pages/encuestas/widgets/no_data_encuestas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar.dart';

class EncuestasPage extends StatelessWidget {
  const EncuestasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              AppBarPage(
                title: 'ENCUESTAS',
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
                height: Get.size.height * 0.05,
              ),
              NoDataEncuestas()
            ],
          ),
        ));
  }
}
