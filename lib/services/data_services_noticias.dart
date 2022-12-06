import 'dart:convert';

import 'package:antex/model/noticias/comentarios.dart';
import 'package:antex/model/noticias/noticias.dart';
import 'package:antex/model/vuelos.dart';
import 'package:antex/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class DataServicesNoticias {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getNoticias() async {
    String apiUrl = baseUrl + "noticias";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Noticias> getDatosNoticiasList() async {
    Response response;
    response = await getNoticias();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Noticias.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getComentarios(int idNoticia) async {
    String apiUrl = baseUrl + "noticias/${idNoticia}/comentarios";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Comentarios> getDatosComentariosList(int idNoticia) async {
    Response response;
    response = await getComentarios(idNoticia);
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Comentarios.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
