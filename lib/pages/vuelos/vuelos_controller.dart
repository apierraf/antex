import 'package:antex/model/vuelos.dart';
import 'package:antex/services/data_services_vuelos.dart';
import 'package:get/get.dart';

import '../../model/vuelo_proximo.dart';

class VuelosController extends GetxController {
  var isLoading = true.obs;
  var data = <Datum>[].obs;
  var dataProximo = Data().obs;
  var vuelo = Vuelos().obs;
  var vueloProximo = VueloProximo().obs;

  @override
  void onInit() {
    fetchVuelos();
    super.onInit();
  }

  void fetchVuelos() async {
    isLoading(true);
    try {
      var todos = await DataServicesVuelos.getDatosVuelosList();
      var todosProximo = await DataServicesVuelos.getDatosProximoVueloList();

      vuelo.value = todos;
      vueloProximo.value = todosProximo;

      data.value = vuelo.value.data!;
      dataProximo.value = vueloProximo.value.data!;
    } finally {
      isLoading(false);
    }
  }
}
