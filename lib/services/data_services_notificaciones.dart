import 'dart:convert';

import 'package:antex/model/notificaciones/notificaciones.dart';
import 'package:antex/model/notificaciones/notificaciones_nuevas_total.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../utils/constants.dart';

class DataServicesNotificaciones {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getNotificaciones() async {
    String apiUrl = baseUrl + "usuarios/$expediente/notificaciones";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Notificaciones> getDatosNotificacionesList() async {
    //List<Vuelos> todoList = [];

    Response response;
    response = await getNotificaciones();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Notificaciones.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getNotificacionesNuevasTotal() async {
    String apiUrl =
        baseUrl + "usuarios/$expediente/notificaciones-nuevas/total";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<NotificacionesNuevasTotal>
      getDatosNotificacionesNuevasTotalList() async {
    //List<Vuelos> todoList = [];

    Response response;
    response = await getNotificacionesNuevasTotal();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return NotificacionesNuevasTotal.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
