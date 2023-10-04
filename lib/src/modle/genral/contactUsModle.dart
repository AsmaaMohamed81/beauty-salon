class ContactUsModle {
  ContactUsModle({this.success, this.message, this.code});

  bool? success;
  String? message;
  int? code;

  factory ContactUsModle.fromJson(Map<String, dynamic> json) => ContactUsModle(
      success: json["success"] == null ? null : json["success"],
      message: json["message"] == null ? null : json["message"],
      code: json["code"] == null ? null : json["code"]);
}
