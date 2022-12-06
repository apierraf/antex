import 'dart:convert';

import 'package:antex/model/servicios_logisticos/servicios_logisticos.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../model/servicios_logisticos/servicios_logisticos_post.dart';
import '../utils/constants.dart';

class DataServicesServiciosLogisticos {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getServiciosLogisticos() async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-logisticas";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<ServiciosLogisticos> getDatosServiciosLogisticosList() async {
    Response response;
    response = await getServiciosLogisticos();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return ServiciosLogisticos.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<ServiciosLogisticosPost> serviciosLogisticosPost(
      int vueloId,
      String fecha,
      bool desayuno,
      bool almuerzo,
      bool cena,
      bool alojamiento) async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-servicio";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "vueloId": vueloId,
          "solicitudes_servicios": {
            "fecha": fecha,
            "desayuno": desayuno,
            "almuerzo": almuerzo,
            "cena": cena,
            "alojamiento": alojamiento,
          },
        }));

    if (response.statusCode == 201) {
      return ServiciosLogisticosPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
