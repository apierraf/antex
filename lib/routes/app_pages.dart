import 'package:antex/model/noticias/noticias.dart';
import 'package:antex/pages/acercade/acercade_page.dart';
import 'package:antex/pages/beneficiario/beneficiario_page.dart';
import 'package:antex/pages/contactenos/contactenos_page.dart';
import 'package:antex/pages/cuenta_akz_iban/cuenta_akz_iban_page.dart';
import 'package:antex/pages/encuestas/encuestas_page.dart';
import 'package:antex/pages/estipendios/estipendios_buscar_page.dart';
import 'package:antex/pages/estipendios/estipendios_page.dart';
import 'package:antex/pages/home/home_page.dart';
import 'package:antex/pages/login/login_page.dart';
import 'package:antex/pages/noticias/comentarios/comentarios_page.dart';
import 'package:antex/pages/noticias/noticias_page.dart';
import 'package:antex/pages/noticias/widgets/details_noticia.dart';
import 'package:antex/pages/notificaciones/notificaciones_page.dart';
import 'package:antex/pages/perfil/perfil_page.dart';
import 'package:antex/pages/preguntas_frecuentes/preguntas_frecuentes_page.dart';
import 'package:antex/pages/servicios_logisticos/servicios_alojamiento/servicios_alojamiento.dart';
import 'package:antex/pages/servicios_logisticos/servicios_alojamiento/servicios_prueba.dart';
import 'package:antex/pages/servicios_logisticos/servicios_logisticos_page.dart';
import 'package:antex/pages/testimonios/testimonios_page.dart';
import 'package:antex/pages/vuelos/vuelos_buscar_page.dart';
import 'package:antex/pages/vuelos/vuelos_page.dart';
import 'package:antex/pages/widgets/webview.dart';
import 'package:get/route_manager.dart';

import '../pages/dashboard/dashboard_bindings.dart';
import '../pages/dashboard/dashboard_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashBoardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICACIONES,
      page: () => NotificacionesPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.VUELOS,
      page: () => VuelosPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.VUELOSBUSCAR,
      page: () => VuelosBuscarPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ESTIPENDIOS,
      page: () => EstipendiosPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ESTIPENDIOSBUSCAR,
      page: () => EstipendiosBuscarPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CUENTA,
      page: () => CuentaAKZIBANPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.BENEFICIARIO,
      page: () => BeneficiarioPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.PREGUNTAS,
      page: () => PreguntasFrecuentesPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ENCUESTAS,
      page: () => EncuestasPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.TESTIMONIOS,
      page: () => TestimoniosPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.PERFIL,
      page: () => PerfilPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.ACERCADE,
      page: () => AcercadePage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTACTENOS,
      page: () => ContactenosPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SERVICIOS,
      page: () => ServiciosLogisticos(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SERVICIOSALOJAMIENTOPrueba,
      page: () => ServiciosPrueba(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.SERVICIOSALOJAMIENTO,
      page: () => ServiciosAlojamientoPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.NOTICIAS,
      page: () => NoticiasPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILSNOTICIAS,
      page: () => DetailsNoticia(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.COMENTARIOS,
      page: () => ComentariosPage(),
      //binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.WEBVIEW,
      page: () => WebViewPage(),
      //binding: DashboardBinding(),
    ),
  ];
}
