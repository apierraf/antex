// To parse this JSON data, do
//
//     final nomina = nominaFromJson(jsonString);

import 'dart:convert';

Nomina nominaFromJson(String str) => Nomina.fromJson(json.decode(str));

String nominaToJson(Nomina data) => json.encode(data.toJson());

class Nomina {
  Nomina({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  List<Datum>? data;

  factory Nomina.fromJson(Map<String, dynamic> json) => Nomina(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.expediente,
    this.mesAnno,
    this.ingreso,
    this.cobroAngola,
    this.cuentaCuba,
    this.otrosDescuentos,
    this.inverseMesAnno,
  });

  int? id;
  int? expediente;
  String? mesAnno;
  String? ingreso;
  String? cobroAngola;
  String? cuentaCuba;
  String? otrosDescuentos;
  String? inverseMesAnno;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        expediente: json["expediente"],
        mesAnno: json["mes_anno"],
        ingreso: json["ingreso"],
        cobroAngola: json["cobro_angola"],
        cuentaCuba: json["cuenta_cuba"],
        otrosDescuentos: json["otros_descuentos"],
        inverseMesAnno: json["inverse_mes_anno"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "expediente": expediente,
        "mes_anno": mesAnno,
        "ingreso": ingreso,
        "cobro_angola": cobroAngola,
        "cuenta_cuba": cuentaCuba,
        "otros_descuentos": otrosDescuentos,
        "inverse_mes_anno": inverseMesAnno,
      };
}
