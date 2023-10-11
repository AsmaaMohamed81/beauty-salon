import 'AddOrderBodyModel.dart';

class AddOrderHomeModel {
  AddOrderHomeModel({
    this.storeIdFk,
    this.barberName,
    this.orderTime,
    this.orderDate,
    this.customerId,
    this.customerMob,
    this.customerName,
    this.customerAddress,
    this.numPersons,
    this.promoCodeFk,
    this.terms,
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
  String promoCodeFk;
  String terms;
  String total;
  List<ServiceDetail> serviceDetails;

  factory AddOrderHomeModel.fromJson(Map<String, dynamic> json) =>
      AddOrderHomeModel(
        storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
        barberName: json["barber_name"] == null ? null : json["barber_name"],
        orderTime: json["order_time"] == null ? null : json["order_time"],
        orderDate: json["order_date"] == null ? null : json["order_date"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        customerMob: json["customer_mob"] == null ? null : json["customer_mob"],
        customerName:
            json["customer_name"] == null ? null : json["customer_name"],
        customerAddress:
            json["customer_address"] == null ? null : json["customer_address"],
        numPersons: json["num_persons"] == null ? null : json["num_persons"],
        promoCodeFk:
            json["promo_code_fk"] == null ? null : json["promo_code_fk"],
        terms: json["terms"] == null ? null : json["terms"],
        total: json["total"] == null ? null : json["total"],
        serviceDetails: json["service_details"] == null
            ? null
            : List<ServiceDetail>.from(
                json["service_details"].map((x) => ServiceDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "store_id_fk": storeIdFk == null ? null : storeIdFk,
        "barber_name": barberName == null ? null : barberName,
        "order_time": orderTime == null ? null : orderTime,
        "order_date": orderDate == null ? null : orderDate,
        "customer_id": customerId == null ? null : customerId,
        "customer_mob": customerMob == null ? null : customerMob,
        "customer_name": customerName == null ? null : customerName,
        "customer_address": customerAddress == null ? null : customerAddress,
        "num_persons": numPersons == null ? null : numPersons,
        "promo_code_fk": promoCodeFk == null ? null : promoCodeFk,
        "terms": terms == null ? null : terms,
        "total": total == null ? null : total,
        "service_details": serviceDetails == null
            ? null
            : List<dynamic>.from(serviceDetails.map((x) => x.toJson())),
      };
}

// class ServiceDetail {
//   ServiceDetail({
//     this.serviceIdFk,
//     this.servicePrice,
//   });
//
//   String serviceIdFk;
//   String servicePrice;
//
//   factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
//     serviceIdFk: json["service_id_fk"] == null ? null : json["service_id_fk"],
//     servicePrice: json["service_price"] == null ? null : json["service_price"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
//     "service_price": servicePrice == null ? null : servicePrice,
//   };
// }
