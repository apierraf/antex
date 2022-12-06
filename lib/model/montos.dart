// To parse this JSON data, do
//
//     final montos = montosFromJson(jsonString);

import 'dart:convert';

Montos montosFromJson(String str) => Montos.fromJson(json.decode(str));

String montosToJson(Montos data) => json.encode(data.toJson());

class Montos {
  Montos({
    this.listMontos,
    this.meses,
  });

  List<String>? listMontos;
  int? meses;

  factory Montos.fromJson(Map<String, dynamic> json) => Montos(
        listMontos: List<String>.from(json["listMontos"].map((x) => x)),
        meses: json["meses"],
      );

  Map<String, dynamic> toJson() => {
        "listMontos": List<dynamic>.from(listMontos!.map((x) => x)),
        "meses": meses,
      };
}
