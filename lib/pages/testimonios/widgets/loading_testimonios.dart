import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/shimmer.dart';

class LoadingTestimonios extends StatelessWidget {
  const LoadingTestimonios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      child: Container(
        height: 150,
        child: Stack(alignment: Alignment.center, children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.white,
          ),
          Positioned.fill(
            left: 75,
            child: ShimmerWidget.rectangle(
              height: 80,
              width: double.infinity,
            ),
          ),
          Positioned.fill(
              left: 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: ShimmerWidget.circular(
                  width: 150,
                  height: 150,
                ),
              ))
        ]),
      ),
    );
  }
}
