import 'dart:convert';

TestimoniosPost testimoniosPostFromJson(String str) =>
    TestimoniosPost.fromJson(json.decode(str));

String cambioContrasenaToJson(TestimoniosPost data) =>
    json.encode(data.toJson());

class TestimoniosPost {
  TestimoniosPost({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory TestimoniosPost.fromJson(Map<String, dynamic> json) =>
      TestimoniosPost(
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
