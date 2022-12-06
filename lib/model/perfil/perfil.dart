// To parse this JSON data, do
//
//     final perfil = perfilFromJson(jsonString);

import 'dart:convert';

Perfil perfilFromJson(String str) => Perfil.fromJson(json.decode(str));

String perfilToJson(Perfil data) => json.encode(data.toJson());

class Perfil {
  Perfil({
    this.id,
    this.nombreUsuario,
    this.contrasenna,
    this.expediente,
    this.createdAt,
    this.updatedAt,
    this.email,
    this.foto,
    this.fechaRegistro,
    this.fechaActivacion,
    this.condiciones,
    this.cambioPass,
    this.nombreCompleto,
    this.ultEncuesta,
    this.active,
    this.roleStatusId,
    this.pathImagen,
  });

  int? id;
  String? nombreUsuario;
  String? contrasenna;
  int? expediente;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? email;
  String? foto;
  DateTime? fechaRegistro;
  dynamic fechaActivacion;
  int? condiciones;
  int? cambioPass;
  String? nombreCompleto;
  int? ultEncuesta;
  int? active;
  int? roleStatusId;
  String? pathImagen;

  factory Perfil.fromJson(Map<String, dynamic> json) => Perfil(
        id: json["id"],
        nombreUsuario: json["nombre_usuario"],
        contrasenna: json["contrasenna"],
        expediente: json["expediente"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        email: json["email"],
        foto: json["foto"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
        fechaActivacion: json["fecha_activacion"],
        condiciones: json["condiciones"],
        cambioPass: json["cambio_pass"],
        nombreCompleto: json["nombre_completo"],
        ultEncuesta: json["ult_encuesta"],
        active: json["active"],
        roleStatusId: json["role_status_id"],
        pathImagen: json["path_imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_usuario": nombreUsuario,
        "contrasenna": contrasenna,
        "expediente": expediente,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "email": email,
        "foto": foto,
        "fecha_registro":
            "${fechaRegistro!.year.toString().padLeft(4, '0')}-${fechaRegistro!.month.toString().padLeft(2, '0')}-${fechaRegistro!.day.toString().padLeft(2, '0')}",
        "fecha_activacion": fechaActivacion,
        "condiciones": condiciones,
        "cambio_pass": cambioPass,
        "nombre_completo": nombreCompleto,
        "ult_encuesta": ultEncuesta,
        "active": active,
        "role_status_id": roleStatusId,
        "path_imagen": pathImagen,
      };
}
