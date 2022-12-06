import 'dart:convert';

import 'package:antex/model/solicitudes_iban/solicitudes_iban.dart';
import 'package:antex/model/solicitudes_iban/solicitudes_iban_delete.dart';
import 'package:antex/model/solicitudes_iban/solicitudes_iban_put.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../model/solicitudes_iban/solicitudes_iban_post.dart';
import '../utils/constants.dart';

class DataServicesIban {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getSolicitudesIban() async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-iban";

    final response = await get(Uri.parse(apiUrl), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<SolicitudesIban> getDatosSolicitudesIbanList() async {
    //List<Vuelos> todoList = [];

    Response response;
    response = await getSolicitudesIban();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return SolicitudesIban.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<SolicitudesIbanPost> solicitudesIbanPost(
      String noAKZ, String iban) async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-iban";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "no_akz": noAKZ,
          "iban": iban,
        }));

    if (response.statusCode == 201) {
      return SolicitudesIbanPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //DELETE
  static Future<SolicitudesIbanDelete> solicitudesIbanDelete(int id) async {
    String apiUrl = baseUrl + "solicitudes/$id/solicitudes-iban";

    //Response response;
    final response = await delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return SolicitudesIbanDelete.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //UPDATE
  static Future<SolicitudesIbanPut> solicitudesIbanUpdate(
      int id, String noAKZ, String iban) async {
    String apiUrl = baseUrl + "solicitudes-iban/$id";

    //Response response;
    final response = await put(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "no_akz": noAKZ,
          "iban": iban,
        }));

    if (response.statusCode == 200) {
      return SolicitudesIbanPut.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
