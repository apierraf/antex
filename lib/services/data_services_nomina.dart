import 'dart:convert';

import 'package:antex/model/nomina.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../utils/constants.dart';

class DataServicesNomina {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getNomina() async {
    String apiUrl = baseUrl + "usuarios/$expediente/nomina";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Nomina> getDatosNominaList() async {
    List<Nomina> todoList = [];

    Response response;
    response = await getNomina();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      // var body = json.decode(response.body);
      var body = json.decode(response.body);

      return Nomina.fromJson(body);

      //return nominaFromJson(response.body);

      //return Nomina.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
