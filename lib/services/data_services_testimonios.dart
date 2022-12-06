import 'dart:convert';

import 'package:antex/model/testimonios/envio_testimonio.dart';
import 'package:antex/model/testimonios/testimonios.dart';
import 'package:antex/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

class DataServicesTestimonios {
  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';
  static final storageKeyToken = 'token';

  static var expediente = getStorage.read(storageKeyExpediente);
  static var token = getStorage.read(storageKeyToken);

  //READ
  static Future getTestimonios() async {
    String apiUrl = baseUrl + "testimonios";

    final response = await get(Uri.parse(apiUrl), headers: {
      //HttpHeaders.authorizationHeader: "Basic $basicAuth"
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    return response;
  }

  static Future<Testimonio> getDatosTestimoniosList() async {
    Response response;
    response = await getTestimonios();
    print("Code is ${response.statusCode}");
    print("Response is ${response.body}");

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return Testimonio.fromJson(body);
    } else {
      throw Exception('Fallo de carga');
    }
  }

  //POST
  static Future<TestimoniosPost> testimonioPost(String testimonio) async {
    String apiUrl = baseUrl + "usuarios/$expediente/testimonios";

    //Response response;
    final response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "testimonio": testimonio,
        }));

    if (response.statusCode == 201) {
      return TestimoniosPost.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed');
    }
  }
}
