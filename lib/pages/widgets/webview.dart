import 'package:antex/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({
    Key? key,
  }) : super(key: key);

  //final String? url;

  static final getStorage = GetStorage();
  static final storageKeyExpediente = 'expediente';

  static var expediente = getStorage.read(storageKeyExpediente);

  String urlconoceangola = baseUrl + "conoce-angola/${Get.arguments['angola']}";
  String urlcontratotrabajo = baseUrl + "${expediente}/contrato-trabajo";
  // String urlexistecontratotrabajo = baseUrl + "${expediente}/existe-contrato-trabajo";
  // String urlestadocuenta = baseUrl + "${expediente}/estado-cuenta";
  // String urlexisteestadocuenta = baseUrl + "${expediente}/existe-estado-cuenta";
  // String urlcta= baseUrl + "${expediente}/descargar-cta";
  // String urlexistecta= baseUrl + "${expediente}/existe-cta";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: urlconoceangola,
        //initialUrl: 'https://flutter.dev/',
      ),
    ));
  }
}
