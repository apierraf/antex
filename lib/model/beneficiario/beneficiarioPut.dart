// To parse this JSON data, do
//
//     final beneficiarioPut = beneficiarioPutFromJson(jsonString);

import 'dart:convert';

BeneficiarioPut beneficiarioPutFromJson(String str) =>
    BeneficiarioPut.fromJson(json.decode(str));

String beneficiarioPutToJson(BeneficiarioPut data) =>
    json.encode(data.toJson());

class BeneficiarioPut {
  BeneficiarioPut({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory BeneficiarioPut.fromJson(Map<String, dynamic> json) =>
      BeneficiarioPut(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
