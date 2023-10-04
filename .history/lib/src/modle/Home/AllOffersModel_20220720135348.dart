// To parse this JSON data, do
//
//     final allOffersModel = allOffersModelFromJson(jsonString);

import 'dart:convert';

import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';

AllOffersModel allOffersModelFromJson(String str) => AllOffersModel.fromJson(json.decode(str));

String allOffersModelToJson(AllOffersModel data) => json.encode(data.toJson());

class AllOffersModel {
  AllOffersModel({
    this.offers,
  });

  List<Offer> offers;

  factory AllOffersModel.fromJson(Map<String, dynamic> json) => AllOffersModel(
    offers: json["offers"] == null ? null : List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "offers": offers == null ? null : List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}

class Offer {
  Offer({
    this.offerId,
    this.storeIdFk,
    this.offerDate,
    this.offerName,
    this.offerNameEn,
    this.fromDate,
    this.toDate,
    this.offerPrice,
    this.offerImg,
    this.offerDetails,
    this.active,
    this.storeId,
    this.storeName,
    this.storeNameEn,
    this.mainFe2AIdFk,
    this.mainImage,
    this.address,
    this.addressEn,
    this.latitude,
    this.longtitude,
    this.phone,
    this.status,
    this.storesDays,
    this.storesServices,
    this.storesImages,
    this.rating,
  });

  String offerId;
  String storeIdFk;
  String offerDate;
  String offerName;
  String offerNameEn;
  String fromDate;
  String toDate;
  String offerPrice;
  String offerImg;
  String offerDetails;
  String active;
  String storeId;
  String storeName;
  String storeNameEn;
  String mainFe2AIdFk;
  String mainImage;
  String address;
  String addressEn;
  String latitude;
  String longtitude;
  String phone;
  String status;
  List<StoresDay> storesDays;
  List<StoresService> storesServices;
  List<StoresImage> storesImages;
  dynamic rating;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    offerId: json["offer_id"] == null ? null : json["offer_id"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    offerDate: json["offer_date"] == null ? null : json["offer_date"],
    offerName: json["offer_name"] == null ? null : json["offer_name"],
    offerNameEn: json["offer_name_en"] == null ? null : json["offer_name_en"],
    fromDate: json["from_date"] == null ? null : json["from_date"],
    toDate: json["to_date"] == null ? null : json["to_date"],
    offerPrice: json["offer_price"] == null ? null : json["offer_price"],
    offerImg: json["offer_img"] == null ? null : json["offer_img"],
    offerDetails: json["offer_details"] == null ? null : json["offer_details"],
    active: json["active"] == null ? null : json["active"],
    storeId: json["store_id"] == null ? null : json["store_id"],
    storeName: json["store_name"] == null ? null : json["store_name"],
    storeNameEn: json["store_name_en"] == null ? null : json["store_name_en"],
    mainFe2AIdFk: json["main_fe2a_id_fk"] == null ? null : json["main_fe2a_id_fk"],
    mainImage: json["main_image"] == null ? null : json["main_image"],
    address: json["address"] == null ? null : json["address"],
    addressEn: json["address_en"] == null ? null : json["address_en"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longtitude: json["longtitude"] == null ? null : json["longtitude"],
    phone: json["phone"] == null ? null : json["phone"],
    status: json["status"] == null ? null : json["status"],
    storesDays: json["stores_days"] == null ? null : List<StoresDay>.from(json["stores_days"].map((x) => StoresDay.fromJson(x))),
    storesServices: json["stores_services"] == null ? null : List<StoresService>.from(json["stores_services"].map((x) => StoresService.fromJson(x))),
    storesImages: json["stores_images"] == null ? null : List<StoresImage>.from(json["stores_images"].map((x) => StoresImage.fromJson(x))),
    rating: json["rating"] == null ? null : json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "offer_id": offerId == null ? null : offerId,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "offer_date": offerDate == null ? null : offerDate,
    "offer_name": offerName == null ? null : offerName,
    "offer_name_en": offerNameEn == null ? null : offerNameEn,
    "from_date": fromDate == null ? null : fromDate,
    "to_date": toDate == null ? null : toDate,
    "offer_price": offerPrice == null ? null : offerPrice,
    "offer_img": offerImg == null ? null : offerImg,
    "offer_details": offerDetails == null ? null : offerDetails,
    "active": active == null ? null : active,
    "store_id": storeId == null ? null : storeId,
    "store_name": storeName == null ? null : storeName,
    "store_name_en": storeNameEn == null ? null : storeNameEn,
    "main_fe2a_id_fk": mainFe2AIdFk == null ? null : mainFe2AIdFk,
    "main_image": mainImage == null ? null : mainImage,
    "address": address == null ? null : address,
    "address_en": addressEn == null ? null : addressEn,
    "latitude": latitude == null ? null : latitude,
    "longtitude": longtitude == null ? null : longtitude,
    "phone": phone == null ? null : phone,
    "status": status == null ? null : status,
    "stores_days": storesDays == null ? null : List<dynamic>.from(storesDays.map((x) => x.toJson())),
    "stores_services": storesServices == null ? null : List<dynamic>.from(storesServices.map((x) => x.toJson())),
    "stores_images": storesImages == null ? null : List<dynamic>.from(storesImages.map((x) => x.toJson())),
    "rating": rating == null ? null : rating,
  };
}

class StoresDay {
  StoresDay({
    this.id,
    this.storeIdFk,
    this.dayN,
    this.dayNEn,
    this.fromT,
    this.toT,
  });

  String id;
  String storeIdFk;
  String dayN;
  dynamic dayNEn;
  String fromT;
  String toT;

  factory StoresDay.fromJson(Map<String, dynamic> json) => StoresDay(
    id: json["id"] == null ? null : json["id"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    dayN: json["day_n"] == null ? null : json["day_n"],
    dayNEn: json["day_n_en"],
    fromT: json["from_t"] == null ? null : json["from_t"],
    toT: json["to_t"] == null ? null : json["to_t"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "day_n": dayN == null ? null : dayN,
    "day_n_en": dayNEn,
    "from_t": fromT == null ? null : fromT,
    "to_t": toT == null ? null : toT,
  };
}

class StoresImage {
  StoresImage({
    this.imageId,
    this.storeIdFk,
    this.imageName,
  });

  String imageId;
  String storeIdFk;
  String imageName;

  factory StoresImage.fromJson(Map<String, dynamic> json) => StoresImage(
    imageId: json["image_id"] == null ? null : json["image_id"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    imageName: json["image_name"] == null ? null : json["image_name"],
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId == null ? null : imageId,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "image_name": imageName == null ? null : imageName,
  };
}

// class StoresService {
//   StoresService({
//     this.id,
//     this.storeIdFk,
//     this.serviceIdFk,
//     this.servicePrice,
//     this.fe2AName,
//     this.fe2ANameEn,
//     this.fe2AImage,
//   });
//
//   String id;
//   String storeIdFk;
//   String serviceIdFk;
//   String servicePrice;
//   String fe2AName;
//   String fe2ANameEn;
//   String fe2AImage;
//
//   factory StoresService.fromJson(Map<String, dynamic> json) => StoresService(
//     id: json["id"] == null ? null : json["id"],
//     storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
//     serviceIdFk: json["service_id_fk"] == null ? null : json["service_id_fk"],
//     servicePrice: json["service_price"] == null ? null : json["service_price"],
//     fe2AName: json["fe2a_name"] == null ? null : json["fe2a_name"],
//     fe2ANameEn: json["fe2a_name_en"] == null ? null : json["fe2a_name_en"],
//     fe2AImage: json["fe2a_image"] == null ? null : json["fe2a_image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "store_id_fk": storeIdFk == null ? null : storeIdFk,
//     "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
//     "service_price": servicePrice == null ? null : servicePrice,
//     "fe2a_name": fe2AName == null ? null : fe2AName,
//     "fe2a_name_en": fe2ANameEn == null ? null : fe2ANameEn,
//     "fe2a_image": fe2AImage == null ? null : fe2AImage,
//   };
// }
