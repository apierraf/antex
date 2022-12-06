import 'package:antex/model/testimonios/testimonios.dart';
import 'package:antex/services/data_services_testimonios.dart';
import 'package:get/get.dart';

class TestimoniosController extends GetxController {
  var isLoading = true.obs;
  var data = <Datum>[].obs;

  var testimonio = Testimonio().obs;

  @override
  void onInit() {
    fetchTestimonios();
    super.onInit();
  }

  void fetchTestimonios() async {
    isLoading(true);
    try {
      var todos = await DataServicesTestimonios.getDatosTestimoniosList();

      testimonio.value = todos;

      data.value = testimonio.value.data!;
    } finally {
      isLoading(false);
    }
  }
}
