import 'dart:convert';

import 'package:antex/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:antex/model/login.dart';

class DataServicesLogin {
  static Future<Login> login(String usuario, String contrasena) async {
    String apiUrl = baseUrl + "login";

    //Response response;
    final response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "username": usuario,
          "password": contrasena,
        }));

    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    }
    if (response.statusCode == 401) {
      return Future.error("Credenciales Incorrectas");
      // return Login.fromJson(jsonDecode(response.body));
    } else {
      return Future.error("Verfique el internet");
    }
  }
}
