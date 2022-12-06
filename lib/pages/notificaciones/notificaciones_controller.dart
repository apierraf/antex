import 'package:antex/model/notificaciones/notificaciones.dart';
import 'package:antex/model/notificaciones/notificaciones_nuevas_total.dart';
import 'package:antex/services/data_services_notificaciones.dart';
import 'package:get/get.dart';

class NotificacionesController extends GetxController {
  var isLoading = true.obs;
  var notificaciones = Notificaciones().obs;
  var notificacionestotal = NotificacionesNuevasTotal().obs;

  @override
  void onInit() {
    fetchNotificaciones();
    super.onInit();
  }

  void fetchNotificaciones() async {
    isLoading(true);
    try {
      var todos = await DataServicesNotificaciones.getDatosNotificacionesList();
      var todosNuevasTotal = await DataServicesNotificaciones
          .getDatosNotificacionesNuevasTotalList();

      notificaciones.value = todos;
      notificacionestotal.value = todosNuevasTotal;
    } finally {
      isLoading(false);
    }
  }
}
