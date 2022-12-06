// To parse this JSON data, do
//
//     final notificaciones = notificacionesFromJson(jsonString);

import 'dart:convert';

Notificaciones notificacionesFromJson(String str) =>
    Notificaciones.fromJson(json.decode(str));

String notificacionesToJson(Notificaciones data) => json.encode(data.toJson());

class Notificaciones {
  Notificaciones({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory Notificaciones.fromJson(Map<String, dynamic> json) => Notificaciones(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.notificaciones,
  });

  NotificacionesClass? notificaciones;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notificaciones: NotificacionesClass.fromJson(json["notificaciones"]),
      );

  Map<String, dynamic> toJson() => {
        "notificaciones": notificaciones!.toJson(),
      };
}

class NotificacionesClass {
  NotificacionesClass({
    this.notificaciones,
  });

  List<Notificacione>? notificaciones;

  factory NotificacionesClass.fromJson(Map<String, dynamic> json) =>
      NotificacionesClass(
        notificaciones: List<Notificacione>.from(
            json["notificaciones"].map((x) => Notificacione.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notificaciones":
            List<dynamic>.from(notificaciones!.map((x) => x.toJson())),
      };
}

class Notificacione {
  Notificacione({
    this.id,
    this.fecha,
    this.detalle,
    this.notificada,
    this.tipo,
    this.expediente,
    this.asunto,
  });

  int? id;
  DateTime? fecha;
  String? detalle;
  DateTime? notificada;
  Tipo? tipo;
  int? expediente;
  String? asunto;

  factory Notificacione.fromJson(Map<String, dynamic> json) => Notificacione(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        detalle: json["detalle"],
        notificada: json["notificada"] == null
            ? null
            : DateTime.parse(json["notificada"]),
        tipo: Tipo.fromJson(json["tipo"]),
        expediente: json["expediente"],
        asunto: json["asunto"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "detalle": detalle,
        "notificada": notificada == null
            ? null
            : "${notificada!.year.toString().padLeft(4, '0')}-${notificada!.month.toString().padLeft(2, '0')}-${notificada!.day.toString().padLeft(2, '0')}",
        "tipo": tipo!.toJson(),
        "expediente": expediente,
        "asunto": asunto,
      };
}

class Tipo {
  Tipo({
    this.id,
    this.descripcion,
    this.icono,
    this.color,
  });

  int? id;
  String? descripcion;
  String? icono;
  String? color;

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
        id: json["id"],
        descripcion: json["descripcion"],
        icono: json["icono"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "icono": icono,
        "color": color,
      };
}
