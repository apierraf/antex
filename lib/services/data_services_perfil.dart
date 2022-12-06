import 'dart:convert';

import 'package:antex/model/perfil/cambio_contrasena.dart';
import 'package:antex/model/perfil/perfil.dart';
import 'package:antex/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class DataServicesPerfil {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getPerfil() async {
    String apiUrl = baseUrl + "usuarios/$expediente";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Perfil> getDatosPerfilList() async {
    Response response;
    response = await getPerfil();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Perfil.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<CambioContrasena> cambioContrasena(
      String actual, String nueva, String nuevaContrasena) async {
    String apiUrl = baseUrl + "usuarios/$expediente/cambiar-contrasenna";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "actual": actual,
          "nueva": nueva,
          "nueva_confirmation": nuevaContrasena
        }));

    if (response.statusCode == 200) {
      return CambioContrasena.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
