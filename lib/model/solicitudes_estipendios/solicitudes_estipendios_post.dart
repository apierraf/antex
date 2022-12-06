// To parse this JSON data, do
//
//     final solicitudesEstipendioPost = solicitudesEstipendioPostFromJson(jsonString);

import 'dart:convert';

SolicitudesEstipendioPost solicitudesEstipendioPostFromJson(String str) =>
    SolicitudesEstipendioPost.fromJson(json.decode(str));

String solicitudesEstipendioPostToJson(SolicitudesEstipendioPost data) =>
    json.encode(data.toJson());

class SolicitudesEstipendioPost {
  SolicitudesEstipendioPost({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory SolicitudesEstipendioPost.fromJson(Map<String, dynamic> json) =>
      SolicitudesEstipendioPost(
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
