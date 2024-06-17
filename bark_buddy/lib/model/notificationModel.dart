// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import '../services/dataRepository/mockDataRepository.dart';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  String title;
  String message;
  NotificationType type;

  NotificationModel({
    required this.title,
    required this.message,
    required this.type,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    title: json["title"],
    message: json["message"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "message": message,
    "type": type,
  };
}
