import 'package:antex/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../vuelos_controller.dart';

class VuelosItem extends StatelessWidget {
  const VuelosItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final VuelosController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.flight_outlined,
                  size: 30,
                  color: controller.data[index].id ==
                          controller.dataProximo.value.id
                      ? kColorApp
                      : Colors.black,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Origen: ' + controller.data[index].origen!,
                      style: GoogleFonts.robotoCondensed(
                        color: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? kColorApp
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Motivo: ' + controller.data[index].motivo!,
                      style: GoogleFonts.robotoCondensed(
                        color: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? kColorApp
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.date_range_outlined,
                      size: 30,
                      color: controller.data[index].id ==
                              controller.dataProximo.value.id
                          ? kColorApp
                          : Colors.black,
                    ),
                    Text(
                      controller.data[index].fecha!.day.toString() +
                          '/' +
                          controller.data[index].fecha!.month.toString() +
                          '/' +
                          controller.data[index].fecha!.year.toString(),
                      style: GoogleFonts.robotoCondensed(
                        color: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? kColorApp
                            : Colors.black,
                        fontSize: 12,
                        fontWeight: controller.data[index].id ==
                                controller.dataProximo.value.id
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
