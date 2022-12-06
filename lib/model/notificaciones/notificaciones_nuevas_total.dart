// To parse this JSON data, do
//
//     final notificacionesNuevasTotal = notificacionesNuevasTotalFromJson(jsonString);

import 'dart:convert';

NotificacionesNuevasTotal notificacionesNuevasTotalFromJson(String str) =>
    NotificacionesNuevasTotal.fromJson(json.decode(str));

String notificacionesNuevasTotalToJson(NotificacionesNuevasTotal data) =>
    json.encode(data.toJson());

class NotificacionesNuevasTotal {
  NotificacionesNuevasTotal({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory NotificacionesNuevasTotal.fromJson(Map<String, dynamic> json) =>
      NotificacionesNuevasTotal(
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
    this.total,
  });

  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
