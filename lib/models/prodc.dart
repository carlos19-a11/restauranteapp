// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  String? status;
  List<Datum>? data;

  Product({
    this.status,
    this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? name;
  int? precio;
  String? imagepath;
  String? categoria;

  Datum({
    this.id,
    this.name,
    this.precio,
    this.imagepath,
    this.categoria,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        precio: json["precio"],
        imagepath: json["imagepath"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "precio": precio,
        "imagepath": imagepath,
        "categoria": categoria,
      };
}
