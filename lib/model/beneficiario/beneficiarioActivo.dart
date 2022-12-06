// To parse this JSON data, do
//
//     final beneficiarioActivo = beneficiarioActivoFromJson(jsonString);

import 'dart:convert';

BeneficiarioActivo beneficiarioActivoFromJson(String str) =>
    BeneficiarioActivo.fromJson(json.decode(str));

String beneficiarioActivoToJson(BeneficiarioActivo data) =>
    json.encode(data.toJson());

class BeneficiarioActivo {
  BeneficiarioActivo({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory BeneficiarioActivo.fromJson(Map<String, dynamic> json) =>
      BeneficiarioActivo(
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
    this.nombre1,
    this.nombre2,
    this.apellido1,
    this.apellido2,
    this.direccion,
    this.ci,
    this.idSucursal,
    this.activo,
    this.cuenta,
    this.tarjeta,
    this.sucursal,
  });

  int? id;
  int? expediente;
  String? nombre1;
  dynamic nombre2;
  String? apellido1;
  String? apellido2;
  String? direccion;
  String? ci;
  int? idSucursal;
  bool? activo;
  String? cuenta;
  String? tarjeta;
  Sucursal? sucursal;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        expediente: json["expediente"],
        nombre1: json["nombre1"],
        nombre2: json["nombre2"],
        apellido1: json["apellido1"],
        apellido2: json["apellido2"],
        direccion: json["direccion"],
        ci: json["ci"],
        idSucursal: json["id_sucursal"],
        activo: json["activo"],
        cuenta: json["cuenta"],
        tarjeta: json["tarjeta"],
        sucursal: Sucursal.fromJson(json["sucursal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expediente": expediente,
        "nombre1": nombre1,
        "nombre2": nombre2,
        "apellido1": apellido1,
        "apellido2": apellido2,
        "direccion": direccion,
        "ci": ci,
        "id_sucursal": idSucursal,
        "activo": activo,
        "cuenta": cuenta,
        "tarjeta": tarjeta,
        "sucursal": sucursal!.toJson(),
      };
}

class Sucursal {
  Sucursal({
    this.id,
    this.banco,
    this.numero,
    this.direccion,
    this.idMunicipio,
    this.municipio,
  });

  int? id;
  String? banco;
  String? numero;
  String? direccion;
  int? idMunicipio;
  Municipio? municipio;

  factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        banco: json["banco"],
        numero: json["numero"],
        direccion: json["direccion"],
        idMunicipio: json["id_municipio"],
        municipio: Municipio.fromJson(json["municipio"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banco": banco,
        "numero": numero,
        "direccion": direccion,
        "id_municipio": idMunicipio,
        "municipio": municipio!.toJson(),
      };
}

class Municipio {
  Municipio({
    this.id,
    this.descripcion,
    this.idProvincia,
  });

  int? id;
  String? descripcion;
  int? idProvincia;

  factory Municipio.fromJson(Map<String, dynamic> json) => Municipio(
        id: json["id"],
        descripcion: json["descripcion"],
        idProvincia: json["id_provincia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
        "id_provincia": idProvincia,
      };
}
