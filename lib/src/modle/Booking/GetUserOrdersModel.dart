// To parse this JSON data, do
//
//     final getUserOrdersModel = getUserOrdersModelFromJson(jsonString);

import 'dart:convert';

GetUserOrdersModel getUserOrdersModelFromJson(String str) =>
    GetUserOrdersModel.fromJson(json.decode(str));

String getUserOrdersModelToJson(GetUserOrdersModel data) =>
    json.encode(data.toJson());

class GetUserOrdersModel {
  GetUserOrdersModel({
    this.orders,
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
    this.orderId,
    this.orderType,
    this.storeIdFk,
    this.orderDate,
    this.orderTime,
    this.payType,
    this.allSum,
    this.promoCodeFk,
    this.promoCodePercent,
    this.customerId,
    this.customerName,
    this.customerMob,
    this.customerAddress,
    this.status,
    this.created,
    this.storeName,
    this.details,
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
        customerAddress:
            json["customer_address"] == null ? null : json["customer_address"],
        status: json["status"] == null ? null : json["status"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        storeName: json["store_name"] == null ? null : json["store_name"],
        details: json["details"] == null
            ? null
            : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId == null ? null : orderId,
        "order_type": orderType == null ? null : orderType,
        "store_id_fk": storeIdFk == null ? null : storeIdFk,
        "order_date": orderDate == null ? null : orderDate,
        "order_time": orderTime == null ? null : orderTime,
        "pay_type": payType,
        "all_sum": allSum == null ? null : allSum,
        "promo_code_fk": promoCodeFk == null ? null : promoCodeFk,
        "promo_code_percent":
            promoCodePercent == null ? null : promoCodePercent,
        "customer_id": customerId == null ? null : customerId,
        "customer_name": customerName == null ? null : customerName,
        "customer_mob": customerMob == null ? null : customerMob,
        "customer_address": customerAddress == null ? null : customerAddress,
        "status": status == null ? null : status,
        "created": created == null ? null : created?.toIso8601String(),
        "store_name": storeName == null ? null : storeName,
        "details": details == null
            ? null
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.id,
    this.orderIdFk,
    this.serviceIdFk,
    this.servicePrice,
    this.quantity,
    this.fe2AName,
  });

  String? id;
  String? orderIdFk;
  String? serviceIdFk;
  String? servicePrice;
  String? quantity;
  String? fe2AName;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"] == null ? null : json["id"],
        orderIdFk: json["order_id_fk"] == null ? null : json["order_id_fk"],
        serviceIdFk:
            json["service_id_fk"] == null ? null : json["service_id_fk"],
        servicePrice:
            json["service_price"] == null ? null : json["service_price"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        fe2AName: json["fe2a_name"] == null ? null : json["fe2a_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_id_fk": orderIdFk == null ? null : orderIdFk,
        "service_id_fk": serviceIdFk == null ? null : serviceIdFk,
        "service_price": servicePrice == null ? null : servicePrice,
        "quantity": quantity == null ? null : quantity,
        "fe2a_name": fe2AName == null ? null : fe2AName,
      };
}

// CancelOrdersModel
class CancelOrdersModel {
  CancelOrdersModel({
    this.success,
    this.message,
  });

  int? success;
  String? message;

  factory CancelOrdersModel.fromJson(Map<String, dynamic> json) =>
      CancelOrdersModel(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
      };
}

// GetOrderStatusModel
class GetOrderStatusModel {
  GetOrderStatusModel({
    this.orderStatus,
  });

  OrderStatus? orderStatus;

  factory GetOrderStatusModel.fromJson(Map<String, dynamic> json) =>
      GetOrderStatusModel(
        orderStatus: json["order_status"] == null
            ? null
            : OrderStatus.fromJson(json["order_status"]),
      );

  Map<String, dynamic> toJson() => {
        "order_status": orderStatus == null ? null : orderStatus!.toJson(),
      };
}

class OrderStatus {
  OrderStatus({
    this.neworder,
    this.inprogress,
    this.cancelled,
    this.completed,
  });

  String? neworder;
  String? inprogress;
  String? cancelled;
  String? completed;

  factory OrderStatus.fromJson(Map<String, dynamic> json) => OrderStatus(
        neworder: json["neworder"] == null ? null : json["neworder"],
        inprogress: json["inprogress"] == null ? null : json["inprogress"],
        cancelled: json["cancelled"] == null ? null : json["cancelled"],
        completed: json["completed"] == null ? null : json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "neworder": neworder == null ? null : neworder,
        "inprogress": inprogress == null ? null : inprogress,
        "cancelled": cancelled == null ? null : cancelled,
        "completed": completed == null ? null : completed,
      };
}
