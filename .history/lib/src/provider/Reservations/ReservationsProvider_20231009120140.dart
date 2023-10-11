import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/custom_progress_dialog.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Booking/GetUserOrdersModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ReservationsProvider extends ChangeNotifier {
  NetworkUtil _util = new NetworkUtil();

  String? orderType;
  String orderStatus = "";

  GetUserOrdersModel? getUserOrdersModel;
  myReservationsAPI() async {
    Response res = await _util.post("Api/get_user_orders",
        body: FormData.fromMap({
          "customer_id": NetworkUtil.userModel!.member!.userId,
          "order_type": orderType,
          "order_status": orderStatus
        }));
    if (res.statusCode == 200) {
      print("getUserOrdersModel success");
      getUserOrdersModel = GetUserOrdersModel.fromJson(res.data);
      notifyListeners();
      return getUserOrdersModel;
    } else {
      print("getUserOrdersModel error");
      getUserOrdersModel = GetUserOrdersModel.fromJson(res.data);
      return getUserOrdersModel;
    }
  }

  GetOrderStatusModel? getOrderStatusModel;
  getOrderStatusAPI() async {
    Response res = await _util.get("Api/get_order_status");
    if (res.statusCode == 200) {
      print("getOrderStatusModel success");
      getOrderStatusModel = GetOrderStatusModel.fromJson(res.data);
      return getOrderStatusModel;
    } else {
      print("getOrderStatusModel error");
      getOrderStatusModel = GetOrderStatusModel.fromJson(res.data);
      return getOrderStatusModel;
    }
  }

  CancelOrdersModel? cancelOrdersModel;
  cancelOrderAPI(String order_id) async {
    CustomProgressDialog().showProgressDialog();
    Response res = await _util.post("Api/cancel_order",
        body: FormData.fromMap({
          "user_id_fk": NetworkUtil.userModel!.member!.userId,
          "order_id": order_id
        }));
    if (res.statusCode == 200) {
      print("cancelOrder success");
      CustomProgressDialog().hidePr();
      cancelOrdersModel = CancelOrdersModel.fromJson(res.data);
      CustomAlert().toast(title: cancelOrdersModel!.message);
      myReservationsAPI();
      return cancelOrdersModel;
    } else {
      print("cancelOrder error");
      CustomProgressDialog().hidePr();
      cancelOrdersModel = CancelOrdersModel.fromJson(res.data);
      return cancelOrdersModel;
    }
  }
}
