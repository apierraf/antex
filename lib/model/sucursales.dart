// To parse this JSON data, do
//
//     final sucursales = sucursalesFromJson(jsonString);

import 'dart:convert';

List<Sucursales> sucursalesFromJson(String str) =>
    List<Sucursales>.from(json.decode(str).map((x) => Sucursales.fromJson(x)));

String sucursalesToJson(List<Sucursales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sucursales {
  Sucursales({
    this.value,
    this.text,
  });

  int? value;
  String? text;

  factory Sucursales.fromJson(Map<String, dynamic> json) => Sucursales(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
