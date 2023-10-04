class UserModel {
  UserModel({
    this.member,
    this.token,
    this.success,
    this.message,
  });

  Member member;
  String token;
  int success;
  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        member: json["member"] == null ? null : Member.fromJson(json["member"]),
        token: json["token"] == null ? null : json["token"],
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "member": member == null ? null : member.toJson(),
        "token": token == null ? null : token,
        "success": success == null ? null : success,
        "message": message == null ? null : message,
      };
}

class Member {
  Member({
    this.userId,
    this.userName,
    this.userPhone,
    this.userEmail,
    this.userCity,
    this.status,
    this.mImage,
  });

  String userId;
  String userName;
  String userPhone;
  String userEmail;
  dynamic userCity;
  String status;
  String mImage;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        userId: json["user_id"] == null ? null : json["user_id"],
        userName: json["user_name"] == null ? null : json["user_name"],
        userPhone: json["user_phone"] == null ? null : json["user_phone"],
        userEmail: json["user_email"] == null ? null : json["user_email"],
        userCity: json["user_city"],
        status: json["status"] == null ? null : json["status"],
        mImage: json["m_image"] == null ? null : json["m_image"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "user_name": userName == null ? null : userName,
        "user_phone": userPhone == null ? null : userPhone,
        "user_email": userEmail == null ? null : userEmail,
        "user_city": userCity,
        "status": status == null ? null : status,
        "m_image": mImage == null ? null : mImage,
      };
}

class ContactUsModel {
  ContactUsModel({
    this.success,
    this.message,
  });

  int success;
  String message;

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
      };
}
// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

class ErrorModel {
  ErrorModel({
    this.message,
    this.status,
  });

  String message;
  String status;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "status": status == null ? null : status,
      };
}

//
//      UpdateTokenModel

class UpdateTokenModel {
  UpdateTokenModel({
    this.success,
  });

  int success;

  factory UpdateTokenModel.fromJson(Map<String, dynamic> json) =>
      UpdateTokenModel(
        success: json["success"] == null ? null : json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
      };
}
