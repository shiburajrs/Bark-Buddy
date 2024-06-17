// To parse this JSON data, do
//
//     final breedCategoryModel = breedCategoryModelFromJson(jsonString);

import 'dart:convert';

BreedCategoryModel breedCategoryModelFromJson(String str) => BreedCategoryModel.fromJson(json.decode(str));

String breedCategoryModelToJson(BreedCategoryModel data) => json.encode(data.toJson());

class BreedCategoryModel {
  String message;
  String status;

  BreedCategoryModel({
    required this.message,
    required this.status,
  });

  factory BreedCategoryModel.fromJson(Map<String, dynamic> json) => BreedCategoryModel(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
