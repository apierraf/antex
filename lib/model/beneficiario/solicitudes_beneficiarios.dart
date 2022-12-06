// To parse this JSON data, do
//
//     final solicitudesBeneficiarioPost = solicitudesBeneficiarioPostFromJson(jsonString);

import 'dart:convert';

SolicitudesBeneficiarioPost solicitudesBeneficiarioPostFromJson(String str) =>
    SolicitudesBeneficiarioPost.fromJson(json.decode(str));

String solicitudesBeneficiarioPostToJson(SolicitudesBeneficiarioPost data) =>
    json.encode(data.toJson());

class SolicitudesBeneficiarioPost {
  SolicitudesBeneficiarioPost({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesBeneficiarioPost.fromJson(Map<String, dynamic> json) =>
      SolicitudesBeneficiarioPost(
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
