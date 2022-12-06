// To parse this JSON data, do
//
//     final serviciosLogisticos = serviciosLogisticosFromJson(jsonString);

import 'dart:convert';

ServiciosLogisticos serviciosLogisticosFromJson(String str) =>
    ServiciosLogisticos.fromJson(json.decode(str));

String serviciosLogisticosToJson(ServiciosLogisticos data) =>
    json.encode(data.toJson());

class ServiciosLogisticos {
  ServiciosLogisticos({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory ServiciosLogisticos.fromJson(Map<String, dynamic> json) =>
      ServiciosLogisticos(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.tipoSolicitud,
    this.fecha,
    this.expediente,
    this.estado,
    this.solicitudTransporte,
    this.solicitudesServicio,
  });

  int? id;
  String? tipoSolicitud;
  DateTime? fecha;
  int? expediente;
  Estado? estado;
  dynamic solicitudTransporte;
  List<SolicitudesServicio>? solicitudesServicio;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tipoSolicitud: json["tipo_solicitud"],
        fecha: DateTime.parse(json["fecha"]),
        expediente: json["expediente"],
        estado: Estado.fromJson(json["estado"]),
        solicitudTransporte: json["solicitud_transporte"],
        solicitudesServicio: List<SolicitudesServicio>.from(
            json["solicitudes_servicio"]
                .map((x) => SolicitudesServicio.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_solicitud": tipoSolicitud,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "expediente": expediente,
        "estado": estado!.toJson(),
        "solicitud_transporte": solicitudTransporte,
        "solicitudes_servicio":
            List<dynamic>.from(solicitudesServicio!.map((x) => x.toJson())),
      };
}

class Estado {
  Estado({
    this.id,
    this.idSolicitud,
    this.estado,
    this.fecha,
    this.observaciones,
    this.activo,
  });

  int? id;
  int? idSolicitud;
  String? estado;
  DateTime? fecha;
  dynamic observaciones;
  bool? activo;

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"],
        idSolicitud: json["id_solicitud"],
        estado: json["estado"],
        fecha: DateTime.parse(json["fecha"]),
        observaciones: json["observaciones"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_solicitud": idSolicitud,
        "estado": estado,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "observaciones": observaciones,
        "activo": activo,
      };
}

class SolicitudesServicio {
  SolicitudesServicio({
    this.id,
    this.idVuelo,
    this.fecha,
    this.desayuno,
    this.almuerzo,
    this.cena,
    this.alojamiento,
    this.observaciones,
    this.idSolicitud,
    this.vuelo,
  });

  int? id;
  int? idVuelo;
  DateTime? fecha;
  bool? desayuno;
  bool? almuerzo;
  bool? cena;
  bool? alojamiento;
  String? observaciones;
  int? idSolicitud;
  Vuelo? vuelo;

  factory SolicitudesServicio.fromJson(Map<String, dynamic> json) =>
      SolicitudesServicio(
        id: json["id"],
        idVuelo: json["id_vuelo"],
        fecha: DateTime.parse(json["fecha"]),
        desayuno: json["desayuno"],
        almuerzo: json["almuerzo"],
        cena: json["cena"],
        alojamiento: json["alojamiento"],
        observaciones: json["observaciones"],
        idSolicitud: json["id_solicitud"],
        vuelo: Vuelo.fromJson(json["vuelo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_vuelo": idVuelo,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "desayuno": desayuno,
        "almuerzo": almuerzo,
        "cena": cena,
        "alojamiento": alojamiento,
        "observaciones": observaciones,
        "id_solicitud": idSolicitud,
        "vuelo": vuelo!.toJson(),
      };
}

class Vuelo {
  Vuelo({
    this.id,
    this.fecha,
    this.origen,
    this.aerolinea,
    this.idVueloSigant,
    this.salidaCuba,
  });

  int? id;
  DateTime? fecha;
  String? origen;
  String? aerolinea;
  int? idVueloSigant;
  bool? salidaCuba;

  factory Vuelo.fromJson(Map<String, dynamic> json) => Vuelo(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        origen: json["origen"],
        aerolinea: json["aerolinea"],
        idVueloSigant: json["id_vuelo_sigant"],
        salidaCuba: json["salida_cuba"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "origen": origen,
        "aerolinea": aerolinea,
        "id_vuelo_sigant": idVueloSigant,
        "salida_cuba": salidaCuba,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  dynamic label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
