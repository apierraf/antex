// To parse this JSON data, do
//
//     final vueloProximo = vueloProximoFromJson(jsonString);

import 'dart:convert';

VueloProximo vueloProximoFromJson(String str) =>
    VueloProximo.fromJson(json.decode(str));

String vueloProximoToJson(VueloProximo data) => json.encode(data.toJson());

class VueloProximo {
  VueloProximo({
    this.data,
  });

  Data? data;

  factory VueloProximo.fromJson(Map<String, dynamic> json) => VueloProximo(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        desayuno: json["desayuno"],
        almuerzo: json["almuerzo"],
        cena: json["cena"],
        alojamiento: json["alojamiento"],
        observaciones: json["observaciones"],
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
