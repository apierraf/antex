import 'dart:convert';

import 'package:antex/model/beneficiario/beneficiarioActivo.dart';
import 'package:antex/model/beneficiario/beneficiarioPost.dart';
import 'package:antex/model/beneficiario/beneficiarioPut.dart';
import 'package:antex/model/beneficiario/beneficiarios.dart';
import 'package:antex/model/beneficiario/solicitud_beneficiario_delete.dart';
import 'package:antex/model/beneficiario/solicitudes_beneficiarios.dart';
import 'package:antex/model/municipios.dart';
import 'package:antex/model/provincias.dart';
import 'package:antex/model/sucursales.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

import '../utils/constants.dart';

class DataServicesBeneficiarios {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getBeneficiarios() async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-beneficiario";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Beneficiarios> getDatosBeneficiariosList() async {
    Response response;
    response = await getBeneficiarios();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Beneficiarios.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getProvincias() async {
    String apiUrl = baseUrl + "provincias";

    final response = await get(Uri.parse(apiUrl));

    return response;
  }

  static Future<List<Provincias>> getDatosProvinciasList() async {
    List<Provincias> todoList = [];

    Response response;
    response = await getProvincias();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      //var body = json.decode(response.body);

      return provinciasFromJson(response.body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getMunicipios(int idprovincia) async {
    String apiUrl = baseUrl + "provincias/$idprovincia/municipios";

    final response = await get(Uri.parse(apiUrl));

    return response;
  }

  static Future<List<Municipios>> getDatosMunicipiosList(
      int idProvincia) async {
    //List<Municipios> todoList = [];

    Response response;
    response = await getMunicipios(idProvincia);
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      //var body = json.decode(response.body);

      return municipiosFromJson(response.body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getSucursales(int idMunicipio) async {
    String apiUrl = baseUrl + "municipios/$idMunicipio/sucursales";

    final response = await get(Uri.parse(apiUrl));

    return response;
  }

  static Future<List<Sucursales>> getDatosSucursalesList(
      int idMunicipio) async {
    Response response;
    response = await getSucursales(idMunicipio);
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      //var body = json.decode(response.body);

      return sucursalesFromJson(response.body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //READ
  static Future getBeneficiarioActivo() async {
    String apiUrl = baseUrl + "usuarios/$expediente/beneficiarios/activo";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<BeneficiarioActivo> getDatosBeneficiarioActivo() async {
    Response response;
    response = await getBeneficiarioActivo();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return BeneficiarioActivo.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<BeneficiarioPost> beneficiarioPost(
    String nombre,
    String apellido1,
    String apellido2,
    String direccion,
    String ci,
    String tarjeta,
    String cuenta,
    String provincia,
    String municipio,
    String sucursal,
  ) async {
    String apiUrl = baseUrl + "usuarios/$expediente/beneficiarios";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "nombre1": nombre,
          "apellido1": apellido1,
          "apellido2": apellido2,
          "direccion": direccion,
          "ci": ci,
          "tarjeta": tarjeta,
          "cuenta": cuenta,
          "provincia": provincia,
          "municipio": municipio,
          "sucursal_id": sucursal
        }));

    if (response.statusCode == 201) {
      return BeneficiarioPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //POST
  static Future<SolicitudesBeneficiarioPost> solicitudesBeneficiarioPost(
    String motivo,
    String beneficiario_id,
  ) async {
    String apiUrl = baseUrl + "usuarios/$expediente/solicitudes-beneficiario";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body:
            jsonEncode({"motivo": motivo, "beneficiario_id": beneficiario_id}));

    if (response.statusCode == 201) {
      return SolicitudesBeneficiarioPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //PuT
  static Future<BeneficiarioPut> beneficiarioPut(
    int idBeneficiario,
    String nombre,
    String apellido1,
    String apellido2,
    String direccion,
    String ci,
    String tarjeta,
    String cuenta,
    String provincia,
    String municipio,
    String sucursal,
  ) async {
    String apiUrl = baseUrl + "beneficiarios/${idBeneficiario}";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "nombre1": nombre,
          "apellido1": apellido1,
          "apellido2": apellido2,
          "direccion": direccion,
          "ci": ci,
          "tarjeta": tarjeta,
          "cuenta": cuenta,
          "provincia": provincia,
          "municipio": municipio,
          "sucursal_id": sucursal
        }));

    if (response.statusCode == 200) {
      return BeneficiarioPut.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  //DELETE
  static Future<SolicitudBeneficiarioDelete> solicitudesBeneficiarioDelete(
      int id) async {
    String apiUrl = baseUrl + "solicitudes/$id/solicitudes-beneficiario";

    //Response response;
    final response = await delete(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return SolicitudBeneficiarioDelete.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
