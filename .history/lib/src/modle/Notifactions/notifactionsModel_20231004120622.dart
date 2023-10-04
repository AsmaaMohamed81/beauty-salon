import 'dart:convert';

NotifactionsModel notifactionsModelFromJson(String str) =>
    NotifactionsModel.fromJson(json.decode(str));

String notifactionsModelToJson(NotifactionsModel data) =>
    json.encode(data.toJson());

class NotifactionsModel {
  NotifactionsModel({
    this.success,
    this.notification,
  });

  int? success;
  List<Notification>? notification;

  factory NotifactionsModel.fromJson(Map<String, dynamic> json) =>
      NotifactionsModel(
        success: json["success"] == null ? null : json["success"],
        notification: json["notification"] == null
            ? null
            : List<Notification>.from(
                json["notification"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "notification": notification == null
            ? null
            : List<dynamic>.from(notification!.map((x) => x.toJson())),
      };
}

class Notification {
  Notification({
    this.id,
    this.userIdFk,
    this.title,
    this.msgId,
    this.body,
    this.timeAr,
    this.dateAr,
    this.dateS,
    this.seen,
    this.seenDate,
    this.seenTime,
  });

  String? id;
  String? userIdFk;
  String? title;
  String? msgId;
  String? body;
  String? timeAr;
  String? dateAr;
  String? dateS;
  String? seen;
  dynamic seenDate;
  dynamic seenTime;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"] == null ? null : json["id"],
        userIdFk: json["user_id_fk"] == null ? null : json["user_id_fk"],
        title: json["title"] == null ? null : json["title"],
        msgId: json["msg_id"] == null ? null : json["msg_id"],
        body: json["body"] == null ? null : json["body"],
        timeAr: json["time_ar"] == null ? null : json["time_ar"],
        dateAr: json["date_ar"] == null ? null : json["date_ar"],
        dateS: json["date_s"] == null ? null : json["date_s"],
        seen: json["seen"] == null ? null : json["seen"],
        seenDate: json["seen_date"],
        seenTime: json["seen_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id_fk": userIdFk == null ? null : userIdFk,
        "title": title == null ? null : title,
        "msg_id": msgId == null ? null : msgId,
        "body": body == null ? null : body,
        "time_ar": timeAr == null ? null : timeAr,
        "date_ar": dateAr == null ? null : dateAr,
        "date_s": dateS == null ? null : dateS,
        "seen": seen == null ? null : seen,
        "seen_date": seenDate,
        "seen_time": seenTime,
      };
}
