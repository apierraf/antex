// To parse this JSON data, do
//
//     final beneficiarios = beneficiariosFromJson(jsonString);

import 'dart:convert';

Beneficiarios beneficiariosFromJson(String str) =>
    Beneficiarios.fromJson(json.decode(str));

String beneficiariosToJson(Beneficiarios data) => json.encode(data.toJson());

class Beneficiarios {
  Beneficiarios({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Beneficiarios.fromJson(Map<String, dynamic> json) => Beneficiarios(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.tipoSolicitud,
    this.fecha,
    this.expediente,
    this.solicitudBeneficiario,
    this.estado,
  });

  int? id;
  String? tipoSolicitud;
  DateTime? fecha;
  int? expediente;
  SolicitudBeneficiario? solicitudBeneficiario;
  Estado? estado;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tipoSolicitud: json["tipo_solicitud"],
        fecha: DateTime.parse(
          json["fecha"] == null ? '2022-05-19' : json["fecha"],
        ),
        expediente: json["expediente"],
        solicitudBeneficiario: SolicitudBeneficiario.fromJson(
            json["solicitud_beneficiario"] == null
                ? <String, dynamic>{}
                : json["solicitud_beneficiario"]),
        estado: Estado.fromJson(
            json["estado"] == null ? <String, dynamic>{} : json["estado"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_solicitud": tipoSolicitud,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "expediente": expediente,
        "solicitud_beneficiario": solicitudBeneficiario!.toJson(),
        "estado": estado!.toJson(),
      };
}

class Estado {
  Estado({
    this.id,
    this.idSolicitud,
    this.estado,
    this.fecha,
    this.observaciones,
    this.activo,
  });

  int? id;
  int? idSolicitud;
  String? estado;
  DateTime? fecha;
  dynamic observaciones;
  bool? activo;

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"],
        idSolicitud: json["id_solicitud"],
        estado: json["estado"],
        fecha: DateTime.parse(
            json["fecha"] == null ? '2022-05-19' : json["fecha"]),
        observaciones: json["observaciones"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_solicitud": idSolicitud,
        "estado": estado,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "observaciones": observaciones,
        "activo": activo,
      };
}

class SolicitudBeneficiario {
  SolicitudBeneficiario({
    this.id,
    this.idSolicitud,
    this.motivo,
    this.observaciones,
    this.idBeneficiario,
    this.beneficiario,
  });

  int? id;
  int? idSolicitud;
  String? motivo;
  dynamic observaciones;
  int? idBeneficiario;
  Beneficiario? beneficiario;

  factory SolicitudBeneficiario.fromJson(Map<String, dynamic> json) =>
      SolicitudBeneficiario(
        id: json["id"],
        idSolicitud: json["id_solicitud"],
        motivo: json["motivo"],
        observaciones: json["observaciones"],
        idBeneficiario: json["id_beneficiario"],
        beneficiario: Beneficiario.fromJson(json["beneficiario"] == null
            ? <String, dynamic>{}
            : json["beneficiario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_solicitud": idSolicitud,
        "motivo": motivo,
        "observaciones": observaciones,
        "id_beneficiario": idBeneficiario,
        "beneficiario": beneficiario!.toJson(),
      };
}

class Beneficiario {
  Beneficiario({
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
    this.tarjeta,
    this.cuenta,
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
  String? tarjeta;
  String? cuenta;
  Sucursal? sucursal;

  factory Beneficiario.fromJson(Map<String, dynamic> json) => Beneficiario(
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
        tarjeta: json["tarjeta"],
        cuenta: json["cuenta"],
        sucursal: Sucursal.fromJson(
            json["sucursal"] == null ? <String, dynamic>{} : json["sucursal"]),
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
        "tarjeta": tarjeta,
        "cuenta": cuenta,
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
        municipio: Municipio.fromJson(json["municipio"] == null
            ? <String, dynamic>{}
            : json["municipio"]),
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

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  dynamic label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
