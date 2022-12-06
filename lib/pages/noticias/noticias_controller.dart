import 'package:antex/services/data_services_noticias.dart';
import 'package:get/get.dart';

import '../../model/noticias/noticias.dart';

class NoticiasController extends GetxController {
  var isLoading = true.obs;
  var data = <Datum>[].obs;

  var noticia = Noticias().obs;

  @override
  void onInit() {
    fetchNoticias();
    super.onInit();
  }

  void fetchNoticias() async {
    isLoading(true);
    try {
      var todos = await DataServicesNoticias.getDatosNoticiasList();

      noticia.value = todos;

      data.value = noticia.value.data!;
    } finally {
      isLoading(false);
    }
  }
}
