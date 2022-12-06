import 'dart:convert';

import 'package:antex/model/vuelo_proximo.dart';
import 'package:antex/model/vuelos.dart';
import 'package:antex/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class DataServicesVuelos {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getVuelos() async {
    String apiUrl = baseUrl + "usuarios/$expediente/vuelos";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Vuelos> getDatosVuelosList() async {
    //List<Vuelos> todoList = [];

    Response response;
    response = await getVuelos();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Vuelos.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getProximoVuelo() async {
    String apiUrl = baseUrl + "usuarios/$expediente/vuelos/proximo";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<VueloProximo> getDatosProximoVueloList() async {
    Response response;
    response = await getProximoVuelo();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return VueloProximo.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
