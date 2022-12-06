import 'dart:convert';

import 'package:antex/model/cuenta_cuba.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../utils/constants.dart';

class DataServicesCuentaCuba {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getCuentaCuba() async {
    String apiUrl = baseUrl + "usuarios/$expediente/ctaCuba";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<CuentaCuba> getDatosCuentaCubaList() async {
    Response response;
    response = await getCuentaCuba();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return CuentaCuba.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
