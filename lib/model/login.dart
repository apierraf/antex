// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"] == null ? '' : json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.expediente,
    this.nombre,
    this.angola,
    this.can,
  });

  String? token;
  String? expediente;
  String? nombre;
  int? angola;
  Map<String, bool>? can;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        expediente: json["expediente"],
        nombre: json["nombre"],
        angola: json["angola"],
        can: Map.from(json["can"]).map((k, v) => MapEntry<String, bool>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expediente": expediente,
        "nombre": nombre,
        "angola": angola,
        "can": Map.from(can!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
