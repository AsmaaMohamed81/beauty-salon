import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.id,
    this.to,
    this.message,
  });

  String id;
  String to;
  String message;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    id: json["id"],
    to: json["to"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "to": to,
    "message": message,
  };
}