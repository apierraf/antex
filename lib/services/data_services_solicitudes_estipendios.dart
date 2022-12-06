import 'dart:convert';

import 'package:antex/model/montos.dart';
import 'package:antex/model/solicitudes_estipendios/solicitudes_estipendios.dart';
import 'package:antex/model/solicitudes_estipendios/solicitudes_estipendios_delete.dart';
import 'package:antex/model/solicitudes_estipendios/solicitudes_estipendios_post.dart';
import 'package:antex/model/solicitudes_estipendios/solicitudes_estipendios_put.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../utils/constants.dart';

class DataServicesSolicitudesEstipendios {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getSolicitudesEstipendios() async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-estipendio";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<SolicitudesEstipendios>
      getDatosSolicitudesEstipendiosList() async {
    Response response;
    response = await getSolicitudesEstipendios();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return SolicitudesEstipendios.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<SolicitudesEstipendioPost> solicitudesEstipendiosPost(
      String valor) async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-estipendio";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "valor": valor,
        }));

    if (response.statusCode == 201) {
      return SolicitudesEstipendioPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //DELETE
  static Future<SolicitudesEstipendioDelete> solicitudesEstipendioDelete(
      int id) async {
    String apiUrl = baseUrl + "solicitudes/$id/solicitudes-estipendio";

    //Response response;
    final response = await delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return SolicitudesEstipendioDelete.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //UPDATE
  static Future<SolicitudesEstipendioPut> solicitudesEstipendioUpdate(
      int id, String valor) async {
    String apiUrl = baseUrl + "solicitudes-estipendio/$id";

    //Response response;
    final response = await put(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "valor": valor,
        }));

    if (response.statusCode == 200) {
      return SolicitudesEstipendioPut.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //READ
  static Future getMontos() async {
    String apiUrl = baseUrl + "estipendios/config";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Montos> getDatosMontosList() async {
    Response response;
    response = await getMontos();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Montos.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }
}
