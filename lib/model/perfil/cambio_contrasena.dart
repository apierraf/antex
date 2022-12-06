import 'dart:convert';

CambioContrasena cambioContrasenaFromJson(String str) =>
    CambioContrasena.fromJson(json.decode(str));

String cambioContrasenaToJson(CambioContrasena data) =>
    json.encode(data.toJson());

class CambioContrasena {
  CambioContrasena({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory CambioContrasena.fromJson(Map<String, dynamic> json) =>
      CambioContrasena(
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
