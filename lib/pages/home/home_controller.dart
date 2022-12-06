import 'package:antex/model/cuenta_cuba.dart';
import 'package:antex/model/nomina.dart';
import 'package:antex/model/solicitudes_data.dart';
import 'package:antex/services/data_services_cuenta_cuba.dart';
import 'package:antex/services/data_services_nomina.dart';
import 'package:get/get.dart';

import '../../model/vuelo_proximo.dart';
import '../../services/data_services_vuelos.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  var solicitudesServiciosVacias = false.obs;

  //var dataProximo = Data().obs;
  var vueloProximo = VueloProximo().obs;

  var solicitudesData = <SolicitudesData>[].obs;
  var nomina = Nomina().obs;
  var cuentaCuba = CuentaCuba().obs;

  @override
  void onInit() {
    fetch();

    super.onInit();
  }

  void fetch() async {
    isLoading(true);
    try {
      //await Future.delayed(Duration(seconds: 2), () {});

      var todosProximo = await DataServicesVuelos.getDatosProximoVueloList();

      vueloProximo.value = todosProximo;

      //dataProximo.value = vueloProximo.value.data!;

      if (vueloProximo.value.data!.solicitudesServicio!.isEmpty) {
        solicitudesServiciosVacias.value = true;
      }

      var todoNomina = await DataServicesNomina.getDatosNominaList();

      nomina.value = todoNomina;

      var todoCuentaCuba =
          await DataServicesCuentaCuba.getDatosCuentaCubaList();

      cuentaCuba.value = todoCuentaCuba;
    } finally {
      isLoading(false);
    }
  }

  void solicitudes() {
    for (int i = 0;
        i < vueloProximo.value.data!.solicitudesServicio!.length;
        i++) {
      solicitudesData.add(SolicitudesData(
        desayuno: vueloProximo.value.data!.solicitudesServicio![i].desayuno,
        almuerzo: vueloProximo.value.data!.solicitudesServicio![i].almuerzo,
        cena: vueloProximo.value.data!.solicitudesServicio![i].cena,
        alojamiento:
            vueloProximo.value.data!.solicitudesServicio![i].alojamiento,
        transporte:
            vueloProximo.value.data!.solicitudTransporte == null ? false : true,
      ));
    }
  }
}
