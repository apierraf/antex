// To parse this JSON data, do
//
//     final solicitudesEstipendioDelete = solicitudesEstipendioDeleteFromJson(jsonString);

import 'dart:convert';

SolicitudesEstipendioDelete solicitudesEstipendioDeleteFromJson(String str) =>
    SolicitudesEstipendioDelete.fromJson(json.decode(str));

String solicitudesEstipendioDeleteToJson(SolicitudesEstipendioDelete data) =>
    json.encode(data.toJson());

class SolicitudesEstipendioDelete {
  SolicitudesEstipendioDelete({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesEstipendioDelete.fromJson(Map<String, dynamic> json) =>
      SolicitudesEstipendioDelete(
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
