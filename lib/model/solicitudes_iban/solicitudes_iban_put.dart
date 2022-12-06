// To parse this JSON data, do
//
//     final solicitudesIbanPut = solicitudesIbanPutFromJson(jsonString);

import 'dart:convert';

SolicitudesIbanPut solicitudesIbanPutFromJson(String str) =>
    SolicitudesIbanPut.fromJson(json.decode(str));

String solicitudesIbanPutToJson(SolicitudesIbanPut data) =>
    json.encode(data.toJson());

class SolicitudesIbanPut {
  SolicitudesIbanPut({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesIbanPut.fromJson(Map<String, dynamic> json) =>
      SolicitudesIbanPut(
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
