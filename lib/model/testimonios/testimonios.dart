// To parse this JSON data, do
//
//     final testimonio = testimonioFromJson(jsonString);

import 'dart:convert';

Testimonio testimonioFromJson(String str) =>
    Testimonio.fromJson(json.decode(str));

String testimonioToJson(Testimonio data) => json.encode(data.toJson());

class Testimonio {
  Testimonio({
    this.data,
  });

  List<Datum>? data;

  factory Testimonio.fromJson(Map<String, dynamic> json) => Testimonio(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.testimonio,
    this.estado,
    this.createdAt,
    this.updatedAt,
    this.autor,
    this.imagenColaborador,
    this.colaborador,
  });

  int? id;
  String? testimonio;
  int? estado;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? autor;
  String? imagenColaborador;
  Colaborador? colaborador;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        testimonio: json["testimonio"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        autor: json["autor"],
        imagenColaborador: json["imagen_colaborador"],
        colaborador: Colaborador.fromJson(json["colaborador"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "testimonio": testimonio,
        "estado": estado,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "autor": autor,
        "imagen_colaborador": imagenColaborador,
        "colaborador": colaborador!.toJson(),
      };
}

class Colaborador {
  Colaborador({
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

  factory Colaborador.fromJson(Map<String, dynamic> json) => Colaborador(
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
