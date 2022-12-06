// To parse this JSON data, do
//
//     final comentarios = comentariosFromJson(jsonString);

import 'dart:convert';

Comentarios comentariosFromJson(String str) =>
    Comentarios.fromJson(json.decode(str));

String comentariosToJson(Comentarios data) => json.encode(data.toJson());

class Comentarios {
  Comentarios({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  dynamic message;
  Data? data;

  factory Comentarios.fromJson(Map<String, dynamic> json) => Comentarios(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
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
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    this.comentario,
    this.noticia,
    this.autor,
    this.estado,
    this.createdAt,
    this.updatedAt,
    this.problema,
    this.nombreAutor,
  });

  int? id;
  String? comentario;
  int? noticia;
  int? autor;
  int? estado;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? problema;
  String? nombreAutor;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        comentario: json["comentario"],
        noticia: json["noticia"],
        autor: json["autor"],
        estado: json["estado"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        problema: json["problema"],
        nombreAutor: json["nombre_autor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comentario": comentario,
        "noticia": noticia,
        "autor": autor,
        "estado": estado,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "problema": problema,
        "nombre_autor": nombreAutor,
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
