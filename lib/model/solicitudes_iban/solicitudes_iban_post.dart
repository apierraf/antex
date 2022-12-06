// To parse this JSON data, do
//
//     final solicitudesIbanPost = solicitudesIbanPostFromJson(jsonString);

import 'dart:convert';

SolicitudesIbanPost solicitudesIbanPostFromJson(String str) =>
    SolicitudesIbanPost.fromJson(json.decode(str));

String solicitudesIbanPostToJson(SolicitudesIbanPost data) =>
    json.encode(data.toJson());

class SolicitudesIbanPost {
  SolicitudesIbanPost({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesIbanPost.fromJson(Map<String, dynamic> json) =>
      SolicitudesIbanPost(
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
