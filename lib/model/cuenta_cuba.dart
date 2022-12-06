// To parse this JSON data, do
//
//     final cuentaCuba = cuentaCubaFromJson(jsonString);

import 'dart:convert';

CuentaCuba cuentaCubaFromJson(String str) =>
    CuentaCuba.fromJson(json.decode(str));

String cuentaCubaToJson(CuentaCuba data) => json.encode(data.toJson());

class CuentaCuba {
  CuentaCuba({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory CuentaCuba.fromJson(Map<String, dynamic> json) => CuentaCuba(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.expediente,
    this.acumulado,
    this.disponible,
    this.rutaFichero,
    this.fechaAct,
  });

  int? id;
  int? expediente;
  String? acumulado;
  String? disponible;
  String? rutaFichero;
  String? fechaAct;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      id: json["id"],
      expediente: json["expediente"],
      acumulado: json["acumulado"],
      disponible: json["disponible"],
      rutaFichero: json["ruta_fichero"],
      fechaAct: json["fecha_act"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "expediente": expediente,
        "acumulado": acumulado,
        "disponible": disponible,
        "ruta_fichero": rutaFichero,
        "fecha_act": fechaAct,
      };
}
