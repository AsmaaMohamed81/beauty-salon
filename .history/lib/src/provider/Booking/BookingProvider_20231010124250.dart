import 'dart:convert';
import 'package:beauty_salon/common.dart';
import 'package:beauty_salon/src/MainScreens/mainPage.dart';
import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Booking/AddOrderBodyModel.dart';
import 'package:beauty_salon/src/modle/Booking/AddOrderHomeModel.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode;
import 'dart:async';

import '../../app.dart';

class BookingProvider extends ChangeNotifier {
  NetworkUtil _util = new NetworkUtil();

  String? BarbersName;
  String? selectedTimeVall;
  String? selectedDateVall;
  String? homeAddressVall;
  String? discountCode;
  String? Notes;
  String Phone = NetworkUtil.userModel!.member!.userPhone!;
  String NumberOfPeople = "1";
  String total = "0";
  final List<StoresService> serviceSelected = [];
  final List<ServiceDetail> serviceDetail = [];

  calculatTotalServicePrice() {
    var subTotal = 0.0;
    for (var i = 0; i < serviceSelected.length; i++) {
      subTotal = subTotal + double.parse(serviceSelected[i].servicePrice!);
    }
    total = (subTotal * double.parse(NumberOfPeople)).toString();
    print("kjhjkl" + total);
    notifyListeners();
  }

  Future<ErrorModel> storeOrderApi2(String store_id_fk) async {
    AddOrderBodyModel bodys;
    bodys = AddOrderBodyModel();
    bodys.barberName = BarbersName;
    bodys.storeIdFk = store_id_fk;
    bodys.orderTime = selectedTimeVall;
    bodys.orderDate = selectedDateVall;
    bodys.customerId = NetworkUtil.userModel!.member!.userId;
    bodys.customerMob = Phone;
    bodys.customerName = NetworkUtil.userModel!.member!.userName;
    bodys.customerAddress = "NetworkUtil.userModel.member.userCity";
    bodys.numPersons = NumberOfPeople;
    bodys.typeVisit = "1";
    bodys.total = total;
    for (var i = 0; i < serviceSelected.length; i++) {
      ServiceDetail data = ServiceDetail();
      data.servicePrice = serviceSelected[i].servicePrice;
      data.serviceIdFk = serviceSelected[i].serviceIdFk;
      serviceDetail.add(data);
    }
    bodys.serviceDetails = serviceDetail;
    var body = json.encode(bodys.toJson());
    print("body" + body);

    final response = await http.post(
        Uri.parse(AppConfig.MAIN_API_URL + "Api/add_order"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "lang": appContext.locale.languageCode,
          "type": NetworkUtil.KuafirTypeSelected!, //1 as man  2 as women
        });

    if (response.statusCode == 200) {
      print("doooooooooooooooon");
      // push(MainPage());
      pop();
      BarbersName = null;
      selectedTimeVall = null;
      selectedDateVall = null;
      Phone = "null";
      NumberOfPeople = "null";
      total = "0";
      CustomAlert().toast(title: "تم الحجز بنجاح");

      return ErrorModel.fromJson(json.decode(response.body));
    } else {
      ErrorModel res = ErrorModel.fromJson(json.decode(response.body));
      throw Exception(res.message);
    }
  }

  Future<ErrorModel> addOrderToHomeApi(String store_id_fk) async {
    AddOrderHomeModel bodys = AddOrderHomeModel();
    bodys.barberName = BarbersName;
    bodys.storeIdFk = store_id_fk;
    bodys.orderTime = selectedTimeVall;
    bodys.orderDate = selectedDateVall;
    bodys.customerId = NetworkUtil.userModel!.member!.userId;
    bodys.customerMob = Phone;
    bodys.customerName = NetworkUtil.userModel!.member!.userName;
    bodys.customerAddress = homeAddressVall;
    bodys.numPersons = NumberOfPeople;
    bodys.promoCodeFk = discountCode;
    bodys.terms = "1";
    bodys.total = total;
    for (var i = 0; i < serviceSelected.length; i++) {
      ServiceDetail data = ServiceDetail();
      data.servicePrice = serviceSelected[i].servicePrice;
      data.serviceIdFk = serviceSelected[i].serviceIdFk;
      serviceDetail.add(data);
    }
    bodys.serviceDetails = serviceDetail;
    var body = json.encode(bodys.toJson());
    print("body" + body);

    final response = await http.post(
        Uri.parse(AppConfig.MAIN_API_URL + "Api/add_order_home"),
        body: body,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "lang": appContext.locale.languageCode,
          "type": NetworkUtil.KuafirTypeSelected!, //1 as man  2 as women
        });

    if (response.statusCode == 200) {
      print("doooooooooooooooon");
      push(MainPage());
      // pop();
      BarbersName = null;
      selectedTimeVall = null;
      selectedDateVall = null;
      Phone = "null";
      NumberOfPeople = "null";
      total = "0";
      homeAddressVall = null;
      discountCode = null;
      Notes = null;
      CustomAlert().toast(title: "تم الحجز بنجاح");

      return ErrorModel.fromJson(json.decode(response.body));
    } else {
      ErrorModel res = ErrorModel.fromJson(json.decode(response.body));
      throw Exception(res.message);
    }
  }

  AllBarbersModel? allBarbersModel;
  allBarbersAPI() async {
    Response res = await _util.get("Api/get_all_barbers");
    if (res.statusCode == 200) {
      print("allBarbersAPI success");
      allBarbersModel = AllBarbersModel.fromJson(res.data);
      return allBarbersModel;
    } else {
      print("allBarbersAPI error");
      allBarbersModel = AllBarbersModel.fromJson(res.data);
      return allBarbersModel;
    }
  }
}
