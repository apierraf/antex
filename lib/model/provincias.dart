// To parse this JSON data, do
//
//     final provincias = provinciasFromJson(jsonString);

import 'dart:convert';

List<Provincias> provinciasFromJson(String str) =>
    List<Provincias>.from(json.decode(str).map((x) => Provincias.fromJson(x)));

String provinciasToJson(List<Provincias> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Provincias {
  Provincias({
    this.value,
    this.text,
  });

  int? value;
  String? text;

  factory Provincias.fromJson(Map<String, dynamic> json) => Provincias(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
