import 'package:antex/model/noticias/comentarios.dart';
import 'package:get/get.dart';

import '../../../services/data_services_noticias.dart';

class ComentariosController extends GetxController {
  var isLoading = true.obs;
  var data = <Datum>[].obs;
  var comentarios = Comentarios().obs;
  int idNoticia;

  ComentariosController(this.idNoticia);

  @override
  void onInit() {
    fetchComentarios(idNoticia);
    super.onInit();
  }

  void fetchComentarios(int idNoticia) async {
    isLoading(true);
    try {
      var todos = await DataServicesNoticias.getDatosComentariosList(idNoticia);

      comentarios.value = todos;

      data.value = comentarios.value.data!.data!;
    } finally {
      isLoading(false);
    }
  }
}
