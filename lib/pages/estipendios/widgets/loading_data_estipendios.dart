import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/shimmer.dart';

class LoadingEstipendios extends StatelessWidget {
  //const LoadingVuelos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: ShimmerWidget.circular(
          width: Get.size.width * 0.85,
          height: Get.size.height * 0.1,
          shapeBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
