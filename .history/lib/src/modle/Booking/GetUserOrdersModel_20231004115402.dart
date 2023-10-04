import 'dart:convert';

GetUserOrdersModel getUserOrdersModelFromJson(String str) =>
    GetUserOrdersModel.fromJson(json.decode(str));

String getUserOrdersModelToJson(GetUserOrdersModel data) =>
    json.encode(data.toJson());

class GetUserOrdersModel {
  GetUserOrdersModel({
    required this.orders,
  });

  List<Order>? orders;

  factory GetUserOrdersModel.fromJson(Map<String, dynamic> json) =>
      GetUserOrdersModel(
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.orderId,
    required this.orderType,
    required this.storeIdFk,
    required this.orderDate,
    required this.orderTime,
    this.payType,
    required this.allSum,
    required this.promoCodeFk,
    required this.promoCodePercent,
    required this.customerId,
    required this.customerName,
    required this.customerMob,
    required this.customerAddress,
    required this.status,
    required this.created,
    required this.storeName,
    required this.details,
  });

  String? orderId;
  String? orderType;
  String? storeIdFk;
  String? orderDate;
  String? orderTime;
  dynamic payType;
  String? allSum;
  String? promoCodeFk;
  String? promoCodePercent;
  String? customerId;
  String? customerName;
  String? customerMob;
  String? customerAddress;
  String? status;
  DateTime? created;
  String? storeName;
  List<Detail>? details;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"] == null ? null : json["order_id"],
        orderType: json["order_type"] == null ? null : json["order_type"],
        storeIdFk: json["store_id_fk"] == null ? null : json["store_id_fk"],
        orderDate: json["order_date"] == null ? null : json["order_date"],
        orderTime: json["order_time"] == null ? null : json["order_time"],
        payType: json["pay_type"],
        allSum: json["all_sum"] == null ? null : json["all_sum"],
        promoCodeFk:
            json["promo_code_fk"] == null ? null : json["promo_code_fk"],
        promoCodePercent: json["promo_code_percent"] == null
            ? null
            : json["promo_code_percent"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        customerName:
            json["customer_name"] == null ? null : json["customer_name"],
        customerMob: json["customer_mob"] == null ? null : json["customer_mob"],
        customerAddress: json["customer_address"] == null
            ? null
            : json["customer_address"],
        status: json["status"] == null ? null : json["status"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        storeName: json["store_name"] == null ? null : json["store_name"],
        details: json["details"] == null
            ?