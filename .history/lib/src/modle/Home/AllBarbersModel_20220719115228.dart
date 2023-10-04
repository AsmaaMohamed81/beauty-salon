
class AllBarbersModel {
  AllBarbersModel({
    this.stores,
  });

  List<Store> stores;

  factory AllBarbersModel.fromJson(Map<String, dynamic> json) => AllBarbersModel(
    stores: json["stores"] == null ? null : List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "stores": stores == null ? null : List<dynamic>.from(stores.map((x) => x.toJson())),
  };
}

class Store {
  Store({
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
    this.fe2ATypeName,
    this.storesDays,
    this.storesServices,
    this.storesImages,
    this.rating,
  });

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
  String fe2ATypeName;
  List<StoresDay> storesDays;
  List<StoresService> storesServices;
  List<StoresImage> storesImages;
  dynamic rating;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
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
    fe2ATypeName: json["fe2a_type_name"] == null ? null : json["fe2a_type_name"],
    storesDays: json["stores_days"] == null ? null : List<StoresDay>.from(json["stores_days"].map((x) => StoresDay.fromJson(x))),
    storesServices: json["stores_services"] == null ? null : List<StoresService>.from(json["stores_services"].map((x) => StoresService.fromJson(x))),
    storesImages: json["stores_images"] == null ? null : List<StoresImage>.from(json["stores_images"].map((x) => StoresImage.fromJson(x))),
    rating: json["rating"] == null ? null : json["rating"],
  );

  Map<String, dynamic> toJson() => {
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
    "fe2a_type_name": fe2ATypeName == null ? null : fe2ATypeName,
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
  String dayNEn;
  String fromT;
  String toT;

  factory StoresDay.fromJson(Map<String, dynamic> json) => StoresDay(
    id: json["id"] == null ? null : json["id"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    dayN: json["day_n"] == null ? null : json["day_n"],
    dayNEn: json["day_n_en"] == null ? null : json["day_n_en"],
    fromT: json["from_t"] == null ? null : json["from_t"],
    toT: json["to_t"] == null ? null : json["to_t"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "day_n": dayN == null ? null : dayN,
    "day_n_en": dayNEn == null ? null : dayNEn,
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

class StoresService {
  StoresService({
    this.id,
    this.storeIdFk,
    this.serviceIdFk,
    this.servicePrice,
    this.fe2AName,
    this.fe2ANameEn,
    this.fe2AImage,
    this.isSelected,
  });

  String id;
  String storeIdFk;
  String serviceIdFk;
  String servicePrice;
  String fe2AName;
  String fe2ANameEn;
  String fe2AImage;
  bool isSelected = false;

  factory StoresService.fromJson(Map<String, dynamic> json) => StoresService(
    id: json["id"] == null ? null : json["id"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    serviceIdFk: json["service_id_fk"] == null ? null : json["service_id_fk"],
    servicePrice: json["service_price"] == null ? null : json["service_price"],
    fe2AName: json["fe2a_name"] == null ? null : json["fe2a_name"],
    fe2ANameEn: json["fe2a_name_en"] == null ? null : json["fe2a_name_en"],
    fe2AImage: json["fe2a_image"] == null ? null : json["fe2a_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
    "service_price": servicePrice == null ? null : servicePrice,
    "fe2a_name": fe2AName == null ? null : fe2AName,
    "fe2a_name_en": fe2ANameEn == null ? null : fe2ANameEn,
    "fe2a_image": fe2AImage == null ? null : fe2AImage,
  };
}



// class ServiceDetailsModel {
//   ServiceDetailsModel({
//     this.serviceDetails,
//   });
//
//   List<ServiceDetail00> serviceDetails;
//
//   factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) => ServiceDetailsModel(
//     serviceDetails: json["service_details"] == null ? null : List<ServiceDetail00>.from(json["service_details"].map((x) => ServiceDetail00.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "service_details": serviceDetails == null ? null : List<dynamic>.from(serviceDetails.map((x) => x.toJson())),
//   };
// }

// class ServiceDetail00 {
//   ServiceDetail00({
//     this.serviceIdFk,
//     this.servicePrice,
//   });
//
//   String serviceIdFk;
//   String servicePrice;
//
//   factory ServiceDetail00.fromJson(Map<String, dynamic> json) => ServiceDetail00(
//     serviceIdFk: json["service_id_fk"] == null ? null : json["service_id_fk"],
//     servicePrice: json["service_price"] == null ? null : json["service_price"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
//     "service_price": servicePrice == null ? null : servicePrice,
//   };
// }
