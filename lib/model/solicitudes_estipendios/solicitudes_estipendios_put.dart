// To parse this JSON data, do
//
//     final solicitudesEstipendioDelete = solicitudesEstipendioDeleteFromJson(jsonString);

import 'dart:convert';

SolicitudesEstipendioPut solicitudesEstipendioPutFromJson(String str) =>
    SolicitudesEstipendioPut.fromJson(json.decode(str));

String solicitudesEstipendioDeleteToJson(SolicitudesEstipendioPut data) =>
    json.encode(data.toJson());

class SolicitudesEstipendioPut {
  SolicitudesEstipendioPut({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesEstipendioPut.fromJson(Map<String, dynamic> json) =>
      SolicitudesEstipendioPut(
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
