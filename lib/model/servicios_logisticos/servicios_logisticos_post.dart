import 'dart:convert';

ServiciosLogisticosPost serviciosLogisticosPostFromJson(String str) =>
    ServiciosLogisticosPost.fromJson(json.decode(str));

String serviciosLogisticosPostToJson(ServiciosLogisticosPost data) =>
    json.encode(data.toJson());

class ServiciosLogisticosPost {
  ServiciosLogisticosPost({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory ServiciosLogisticosPost.fromJson(Map<String, dynamic> json) =>
      ServiciosLogisticosPost(
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
