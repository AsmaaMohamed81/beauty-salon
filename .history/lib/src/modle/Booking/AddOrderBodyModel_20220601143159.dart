// To parse this JSON data, do
//
//     final addOrderBodyModel = addOrderBodyModelFromJson(jsonString);

import 'dart:convert';

AddOrderBodyModel addOrderBodyModelFromJson(String str) => AddOrderBodyModel.fromJson(json.decode(str));

String addOrderBodyModelToJson(AddOrderBodyModel data) => json.encode(data.toJson());

class AddOrderBodyModel {
  AddOrderBodyModel({
    this.barberName,
    this.storeIdFk,
    this.orderTime,
    this.orderDate,
    this.customerId,
    this.customerMob,
    this.customerName,
    this.customerAddress,
    this.numPersons,
    this.typeVisit,
    this.total,
    this.serviceDetails,
  });

  String barberName;
  String storeIdFk;
  String orderTime;
  String orderDate;
  String customerId;
  String customerMob;
  String customerName;
  String customerAddress;
  String numPersons;
  String typeVisit;
  String total;
  List<ServiceDetail> serviceDetails;

  factory AddOrderBodyModel.fromJson(Map<String, dynamic> json) => AddOrderBodyModel(
    barberName: json["barber_name"] == null ? null : json["barber_name"],
    storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
    orderTime: json["order_time"] == null ? null : json["order_time"],
    orderDate: json["order_date"] == null ? null : json["order_date"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    customerMob: json["customer_mob"] == null ? null : json["customer_mob"],
    customerName: json["customer_name"] == null ? null : json["customer_name"],
    customerAddress: json["customer_address"] == null ? null : json["customer_address"],
    numPersons: json["num_persons"] == null ? null : json["num_persons"],
    typeVisit: json["type_visit"] == null ? null : json["type_visit"],
    total: json["total"] == null ? null : json["total"],
    serviceDetails: json["service_details"] == null ? null : List<ServiceDetail>.from(json["service_details"].map((x) => ServiceDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "barber_name": barberName == null ? null : barberName,
    "store_id_fk": storeIdFk == null ? null : storeIdFk,
    "order_time": orderTime == null ? null : orderTime,
    "order_date": orderDate == null ? null : orderDate,
    "customer_id": customerId == null ? null : customerId,
    "customer_mob": customerMob == null ? null : customerMob,
    "customer_name": customerName == null ? null : customerName,
    "customer_address": customerAddress == null ? null : customerAddress,
    "num_persons": numPersons == null ? null : numPersons,
    "type_visit": typeVisit == null ? null : typeVisit,
    "total": total == null ? null : total,
    "service_details": serviceDetails == null ? null : List<dynamic>.from(serviceDetails.map((x) => x.toJson())),
  };
}

class ServiceDetail {
  ServiceDetail({
    this.serviceIdFk,
    this.servicePrice,
  });

  String serviceIdFk;
  String servicePrice;

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
    serviceIdFk: json["service_id_fk"] == null ? null : json["service_id_fk"],
    servicePrice: json["service_price"] == null ? null : json["service_price"],
  );

  Map<String, dynamic> toJson() => {
    "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
    "service_price": servicePrice == null ? null : servicePrice,
  };
}
