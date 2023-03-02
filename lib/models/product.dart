// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.available,
    required this.description,
    required this.name,
    this.picture,
    required this.price,
    this.id
  });

  bool available;
  String description;
  String name;
  String? picture;
  int price;
  String? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        description: json["description"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "description": description,
        "name": name,
        "picture": picture,
        "price": price,
      };

  // se usa este metodo para romper la referencia
  Product copy() => Product(
    available: available,
    description: description,
    name: name,
    price: price,
    picture: picture,
    id: id
  );
}
