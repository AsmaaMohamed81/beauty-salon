
class GetServicesModel {
  GetServicesModel({
    this.services,
  });

  List<Service> services;

  factory GetServicesModel.fromJson(Map<String, dynamic> json) => GetServicesModel(
    services: json["services"] == null ? null : List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "services": services == null ? null : List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    this.fe2AId,
    this.fe2AName,
    this.fe2ANameEn,
    this.fe2AType,
    this.fe2AImage,
    this.fromId,
    this.isSelected,
  });

  String fe2AId;
  String fe2AName;
  String fe2ANameEn;
  String fe2AType;
  String fe2AImage;
  String fromId;
  bool isSelected = false;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    fe2AId: json["fe2a_id"] == null ? null : json["fe2a_id"],
    fe2AName: json["fe2a_name"] == null ? null : json["fe2a_name"],
    fe2ANameEn: json["fe2a_name_en"] == null ? null : json["fe2a_name_en"],
    fe2AType: json["fe2a_type"] == null ? null : json["fe2a_type"],
    fe2AImage: json["fe2a_image"] == null ? null : json["fe2a_image"],
    fromId: json["from_id"] == null ? null : json["from_id"],
  );

  Map<String, dynamic> toJson() => {
    "fe2a_id": fe2AId == null ? null : fe2AId,
    "fe2a_name": fe2AName == null ? null : fe2AName,
    "fe2a_name_en": fe2ANameEn == null ? null : fe2ANameEn,
    "fe2a_type": fe2AType == null ? null : fe2AType,
    "fe2a_image": fe2AImage == null ? null : fe2AImage,
    "from_id": fromId == null ? null : fromId,
  };
}
