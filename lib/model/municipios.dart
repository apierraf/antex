// To parse this JSON data, do
//
//     final municipios = municipiosFromJson(jsonString);

import 'dart:convert';

List<Municipios> municipiosFromJson(String str) =>
    List<Municipios>.from(json.decode(str).map((x) => Municipios.fromJson(x)));

String municipiosToJson(List<Municipios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Municipios {
  Municipios({
    this.value,
    this.text,
  });

  int? value;
  String? text;

  factory Municipios.fromJson(Map<String, dynamic> json) => Municipios(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
