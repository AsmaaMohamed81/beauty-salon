class AboutModle {
  AboutModle({
    this.appInfo,
  });

  AppInfo? appInfo;

  factory AboutModle.fromJson(Map<String, dynamic> json) => AboutModle(
        appInfo: json["app_info"] == null
            ? null
            : AppInfo.fromJson(json["app_info"]),
      );

  Map<String, dynamic> toJson() => {
        "app_info": appInfo == null ? null : appInfo!.toJson(),
      };
}

class AppInfo {
  AppInfo({
    this.nameweb,
    this.abbreviationName,
    this.slogan,
    this.aboutApp,
    this.website,
    this.email,
    this.address,
    this.telepon,
    this.mobile,
    this.fax,
    this.logo,
    this.facebook,
    this.twitter,
    this.instagram,
    this.googleMap,
  });

  String? nameweb;
  String? abbreviationName;
  String? slogan;
  dynamic? aboutApp;
  String? website;
  String? email;
  dynamic address;
  String? telepon;
  String? mobile;
  String? fax;
  String? logo;
  String? facebook;
  String? twitter;
  String? instagram;
  String? googleMap;

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        nameweb: json["nameweb"] == null ? null : json["nameweb"],
        abbreviationName: json["abbreviation_name"] == null
            ? null
            : json["abbreviation_name"],
        slogan: json["slogan"] == null ? null : json["slogan"],
        aboutApp: json["about_app"] == null ? null : json["about_app"],
        website: json["website"] == null ? null : json["website"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        telepon: json["telepon"] == null ? null : json["telepon"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        fax: json["fax"] == null ? null : json["fax"],
        logo: json["logo"] == null ? null : json["logo"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        googleMap: json["google_map"] == null ? null : json["google_map"],
      );

  Map<String, dynamic> toJson() => {
        "nameweb": nameweb == null ? null : nameweb,
        "abbreviation_name": abbreviationName == null ? null : abbreviationName,
        "slogan": slogan == null ? null : slogan,
        "about_app": aboutApp == null ? null : aboutApp,
        "website": website == null ? null : website,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "telepon": telepon == null ? null : telepon,
        "mobile": mobile == null ? null : mobile,
        "fax": fax == null ? null : fax,
        "logo": logo == null ? null : logo,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "instagram": instagram == null ? null : instagram,
        "google_map": googleMap == null ? null : googleMap,
      };
}
