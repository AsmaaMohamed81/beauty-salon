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

  String? barberName;
  String? storeIdFk;
  String? orderTime;
  String? orderDate;
  String? customerId;
  String? customerMob;
  String? customerName;
  String? customerAddress;
  String? numPersons;
  String? typeVisit;
  String? total;
  List<ServiceDetail>? serviceDetails;

  factory AddOrderBodyModel.fromJson(Map<String, dynamic> json) =>
      AddOrderBodyModel(
        barberName: json["barber_name"],
        storeIdFk: json["store_id_fk"],
        orderTime: json["order_time"],
        orderDate: json["order_date"],
        customerId: json["customer_id"],
        customerMob: json["customer_mob"],
        customerName: json["customer_name"],
        customerAddress: json["customer_address"],
        numPersons: json["num_persons"],
        typeVisit: json["type_visit"],
        total: json["total"],
        serviceDetails: json["service_details"] != null
            ? List<ServiceDetail>.from(
                json["service_details"].map((x) => ServiceDetail.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "barber_name": barberName,
        "store_id_fk": storeIdFk,
        "order_time": orderTime,
        "order_date": orderDate,
        "customer_id": customerId,
        "customer_mob": customerMob,
        "customer_name": customerName,
        "customer_address": customerAddress,
        "num_persons": numPersons,
        "type_visit": typeVisit,
        "total": total,
        "service_details": serviceDetails != null
            ? List<dynamic>.from(serviceDetails!.map((x) => x.toJson()))
            : null,
      };
}

class ServiceDetail {
  ServiceDetail({
    this.serviceIdFk,
    this.servicePrice,
  });

  String? serviceIdFk;
  String? servicePrice;

  factory ServiceDetail.fromJson(Map<String, dynamic> json) => ServiceDetail(
        serviceIdFk: json["service_id_fk"],
        servicePrice: json["service_price"],
      );

  Map<String, dynamic> toJson() => {
        "service_id_fk": serviceIdFk,
        "service_price": servicePrice,
      };
}
