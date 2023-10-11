
import 'dart:convert';

AllCommentsRatesModel allCommentsRatesModelFromJson(String str) => AllCommentsRatesModel.fromJson(json.decode(str));

String allCommentsRatesModelToJson(AllCommentsRatesModel data) => json.encode(data.toJson());

class AllCommentsRatesModel {
  AllCommentsRatesModel({
    this.rating,
    this.success,
    this.message,
  });

  List<Rating> ?rating;
  int ?success;
  String? message;

  factory AllCommentsRatesModel.fromJson(Map<String, dynamic> json) => AllCommentsRatesModel(
    rating: json["rating"] == null ? null : List<Rating>.from(json["rating"].map((x) => Rating.fromJson(x))),
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating == null ? null : List<dynamic>.from(rating!.map((x) => x.toJson())),
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}

class Rating {
  Rating({
    this.id,
    this.userIdFk,
    this.storeIdFk,
    this.rate,
    this.comment,
    this.date,
    this.storeName,
    this.storeNameEn,
    this.userName,
  });

  String? id;
  String ?userIdFk;
  String ?storeIdFk;
  String ?rate;
  String ?comment;
  String ?date;
  String ?storeName;
  String ?storeNameEn;
  String ?userName;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"] == null ? null : json["id"],
    userIdFk: json["user_id_fk"] == null ? null : json["user_id_fk"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    rate: json["rate"] == null ? null : json["rate"],
    comment: json["comment"] == null ? null : json["comment"],
    date: json["date"] == null ? null : json["date"],
    storeName: json["store_name"] == null ? null : json["store_name"],
    storeNameEn: json["store_name_en"] == null ? null : json["store_name_en"],
    userName: json["user_name"] == null ? null : json["user_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id_fk": userIdFk == null ? null : userIdFk,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "rate": rate == null ? null : rate,
    "comment": comment == null ? null : comment,
    "date": date == null ? null : date,
    "store_name": storeName == null ? null : storeName,
    "store_name_en": storeNameEn == null ? null : storeNameEn,
    "user_name": userName == null ? null : userName,
  };
}
