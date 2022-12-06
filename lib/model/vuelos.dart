// To parse this JSON data, do
//
//     final vuelos = vuelosFromJson(jsonString);

import 'dart:convert';

Vuelos vuelosFromJson(String str) => Vuelos.fromJson(json.decode(str));

//List<Vuelos> vuelosFromJson(String str) => List<Vuelos>.from(json.decode(str));

List<Vuelos> noticiasFromJson(String str) =>
    List<Vuelos>.from(json.decode(str).map((x) => Vuelos.fromJson(x)));

String vuelosToJson(Vuelos data) => json.encode(data.toJson());

class Vuelos {
  Vuelos({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory Vuelos.fromJson(Map<String, dynamic> json) => Vuelos(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.fecha,
    this.origen,
    this.aerolinea,
    this.salidaCuba,
    this.motivo,
    this.anterior,
    this.solicitudesServicio,
    this.solicitudTransporte,
  });

  int? id;
  DateTime? fecha;
  String? origen;
  String? aerolinea;
  bool? salidaCuba;
  String? motivo;
  bool? anterior;
  List<SolicitudesServicio>? solicitudesServicio;
  dynamic solicitudTransporte;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        origen: json["origen"],
        aerolinea: json["aerolinea"],
        salidaCuba: json["salida_cuba"],
        motivo: json["motivo"],
        anterior: json["anterior"],
        solicitudesServicio: List<SolicitudesServicio>.from(
            json["solicitudes_servicio"]
                .map((x) => SolicitudesServicio.fromJson(x))),
        solicitudTransporte: json["solicitud_transporte"] == null
            ? ''
            : json["solicitud_transporte"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "origen": origen,
        "aerolinea": aerolinea,
        "salida_cuba": salidaCuba,
        "motivo": motivo,
        "anterior": anterior,
        "solicitudes_servicio":
            List<dynamic>.from(solicitudesServicio!.map((x) => x.toJson())),
        "solicitud_transporte": solicitudTransporte,
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
    this.solicitud,
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
  Solicitud? solicitud;

  factory SolicitudesServicio.fromJson(Map<String, dynamic> json) =>
      SolicitudesServicio(
        id: json["id"],
        idVuelo: json["id_vuelo"],
        fecha: DateTime.parse(json["fecha"]),
        desayuno: json["desayuno"] == null ? '' : json["desayuno"],
        almuerzo: json["almuerzo"] == null ? '' : json["almuerzo"],
        cena: json["cena"] == null ? '' : json["cena"],
        alojamiento: json["alojamiento"] == null ? '' : json["alojamiento"],
        observaciones:
            json["observaciones"] == null ? '' : json["observaciones"],
        idSolicitud: json["id_solicitud"],
        solicitud: Solicitud.fromJson(json["solicitud"]),
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
        "solicitud": solicitud!.toJson(),
      };
}

class Solicitud {
  Solicitud({
    this.id,
    this.tipoSolicitud,
    this.fecha,
    this.expediente,
    this.estado,
  });

  int? id;
  String? tipoSolicitud;
  DateTime? fecha;
  int? expediente;
  Estado? estado;

  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        id: json["id"],
        tipoSolicitud: json["tipo_solicitud"],
        fecha: DateTime.parse(json["fecha"]),
        expediente: json["expediente"],
        estado: Estado.fromJson(json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_solicitud": tipoSolicitud,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "expediente": expediente,
        "estado": estado!.toJson(),
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
  dynamic? observaciones;
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

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
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
