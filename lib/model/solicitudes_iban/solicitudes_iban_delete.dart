// To parse this JSON data, do
//
//     final solicitudesIbanDelete = solicitudesIbanDeleteFromJson(jsonString);

import 'dart:convert';

SolicitudesIbanDelete solicitudesIbanDeleteFromJson(String str) =>
    SolicitudesIbanDelete.fromJson(json.decode(str));

String solicitudesIbanDeleteToJson(SolicitudesIbanDelete data) =>
    json.encode(data.toJson());

class SolicitudesIbanDelete {
  SolicitudesIbanDelete({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesIbanDelete.fromJson(Map<String, dynamic> json) =>
      SolicitudesIbanDelete(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
