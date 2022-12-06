// To parse this JSON data, do
//
//     final beneficiarioPost = beneficiarioPostFromJson(jsonString);

import 'dart:convert';

BeneficiarioPost beneficiarioPostFromJson(String str) =>
    BeneficiarioPost.fromJson(json.decode(str));

String beneficiarioPostToJson(BeneficiarioPost data) =>
    json.encode(data.toJson());

class BeneficiarioPost {
  BeneficiarioPost({
    this.idBeneficiario,
  });

  int? idBeneficiario;

  factory BeneficiarioPost.fromJson(Map<String, dynamic> json) =>
      BeneficiarioPost(
        idBeneficiario: json["id_beneficiario"],
      );

  Map<String, dynamic> toJson() => {
        "id_beneficiario": idBeneficiario,
      };
}
