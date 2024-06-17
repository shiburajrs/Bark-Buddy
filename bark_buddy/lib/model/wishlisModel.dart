// To parse this JSON data, do
//
//     final wishlistModel = wishlistModelFromJson(jsonString);

import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  int id;
  String petName;
  String breed;
  int price;
  String imagePath;

  WishlistModel({
    required this.id,
    required this.petName,
    required this.breed,
    required this.price,
    required this.imagePath,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    id: json["id"],
    petName: json["petName"],
    breed: json["breed"],
    price: json["price"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "petName": petName,
    "breed": breed,
    "price": price,
    "imagePath": imagePath,
  };
}
