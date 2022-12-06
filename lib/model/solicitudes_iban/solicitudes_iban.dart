// To parse this JSON data, do
//
//     final solicitudesIban = solicitudesIbanFromJson(jsonString);

import 'dart:convert';

SolicitudesIban solicitudesIbanFromJson(String str) =>
    SolicitudesIban.fromJson(json.decode(str));

String solicitudesIbanToJson(SolicitudesIban data) =>
    json.encode(data.toJson());

class SolicitudesIban {
  SolicitudesIban({
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
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory SolicitudesIban.fromJson(Map<String, dynamic> json) =>
      SolicitudesIban(
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
    this.solicitudIban,
    this.estado,
  });

  int? id;
  String? tipoSolicitud;
  DateTime? fecha;
  int? expediente;
  SolicitudIban? solicitudIban;
  Estado? estado;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tipoSolicitud: json["tipo_solicitud"],
        fecha: DateTime.parse(json["fecha"]),
        expediente: json["expediente"],
        solicitudIban: SolicitudIban.fromJson(json["solicitud_iban"]),
        estado: Estado.fromJson(json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_solicitud": tipoSolicitud,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "expediente": expediente,
        "solicitud_iban": solicitudIban!.toJson(),
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

class SolicitudIban {
  SolicitudIban({
    this.id,
    this.idSolicitud,
    this.noAkz,
    this.iban,
    this.observaciones,
  });

  int? id;
  int? idSolicitud;
  String? noAkz;
  String? iban;
  dynamic observaciones;

  factory SolicitudIban.fromJson(Map<String, dynamic> json) => SolicitudIban(
        id: json["id"],
        idSolicitud: json["id_solicitud"],
        noAkz: json["no_akz"],
        iban: json["iban"],
        observaciones: json["observaciones"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_solicitud": idSolicitud,
        "no_akz": noAkz,
        "iban": iban,
        "observaciones": observaciones,
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
