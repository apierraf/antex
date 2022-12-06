// To parse this JSON data, do
//
//     final solicitudBeneficiarioDelete = solicitudBeneficiarioDeleteFromJson(jsonString);

import 'dart:convert';

SolicitudBeneficiarioDelete solicitudBeneficiarioDeleteFromJson(String str) =>
    SolicitudBeneficiarioDelete.fromJson(json.decode(str));

String solicitudBeneficiarioDeleteToJson(SolicitudBeneficiarioDelete data) =>
    json.encode(data.toJson());

class SolicitudBeneficiarioDelete {
  SolicitudBeneficiarioDelete({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudBeneficiarioDelete.fromJson(Map<String, dynamic> json) =>
      SolicitudBeneficiarioDelete(
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
