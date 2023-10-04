import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/custom_progress_dialog.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:beauty_salon/src/modle/Home/AllCommentsRatesModel.dart';
import 'package:beauty_salon/src/modle/Home/AllOffersModel.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:beauty_salon/src/provider/GetServicesModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  NetworkUtil _util = new NetworkUtil();

  AllBarbersModel allBarbersModel;
  allBarbersAPI() async {
    Response res = await _util.get("Api/get_all_barbers");
    if (res.statusCode == 200) {
      print("allBarbersAPI success");
       allBarbersModel = AllBarbersModel.fromJson(res.data);
      return  allBarbersModel;
    } else {
      print("allBarbersAPI error");
      allBarbersModel = AllBarbersModel.fromJson(res.data);
      return allBarbersModel;
    }
  }
  AllOffersModel allOffersModel;
  allOffersAPI() async {
    Response res = await _util.get("Api/get_all_offers");
    if (res.statusCode == 200) {
      print("get_all_offers success");
      allOffersModel = AllOffersModel.fromJson(res.data);
      return  allOffersModel;
    } else {
      print("get_all_offers error");
      allOffersModel = AllOffersModel.fromJson(res.data);
      return allOffersModel;
    }
  }
  ContactUsModel contactUsModel;
  addRateApi(String storeId,String userId,String rate,String comment) async {
    CustomProgressDialog().showProgressDialog();
    Response res = await _util.post("Api/add_rate",
        body: FormData.fromMap(
            {"user_id_fk": storeId,"store_id_fk": userId, "rate": rate,"comment": comment}));
    if (res.statusCode == 200) {
      CustomProgressDialog().hidePr();
      print("add_rate success");
      contactUsModel = ContactUsModel.fromJson(res.data);
      CustomAlert().toast(title: contactUsModel.message);
      return ContactUsModel.fromJson(res.data);
    } else {
      CustomProgressDialog().hidePr();
      print("add_rate error");
      contactUsModel = ContactUsModel.fromJson(res.data);
      return ContactUsModel.fromJson(res.data);
    }
  }
  AllCommentsRatesModel allCommentsRatesModel;
  AllCommentsRatesAPI(String store_id_fk) async {
    Response res = await _util.post("Api/store_comments_rate",
        body: FormData.fromMap(
            {"store_id_fk": store_id_fk}));
    if (res.statusCode == 200) {
      print("All Comments Rates success");
      allCommentsRatesModel = AllCommentsRatesModel.fromJson(res.data);
      return  allOffersModel;
    } else {
      print("All Comments Rates error");
      allCommentsRatesModel = AllCommentsRatesModel.fromJson(res.data);
      return allOffersModel;
    }
  }

  List<Store> searchBarberList = [];
  String searchWord;
  searchBarberAPI() async {
    searchBarberList = [];
    // CustomProgressDialog().showProgressDialog();
    Response res = await _util.post("Api/search_barber",
        body: FormData.fromMap(
            {"search_word": searchWord,"service_id_fk": service_id_fk}));
    print("search_barber "+res.statusCode.toString());
    if (res.statusCode == 200) {
      print("search_barber success");
      allBarbersModel = AllBarbersModel.fromJson(res.data);
      searchBarberList = allBarbersModel.stores;
      notifyListeners();
      // CustomProgressDialog().hidePr();
      return AllBarbersModel.fromJson(res.data);;
    } else {
      print("search_barber error");
      allBarbersModel = AllBarbersModel.fromJson(res.data);
      // CustomProgressDialog().hidePr();
      return AllBarbersModel.fromJson(res.data);;
    }
  }

  GetServicesModel getServicesModel;
  List<Service> ServiceList = [];
  String service_id_fk;// selected from category
  getServicesAPI() async {
    ServiceList = [];
    Response res = await _util.get("Api/get_services");
    if (res.statusCode == 200) {
      print("get_services success");
      getServicesModel = GetServicesModel.fromJson(res.data);
      ServiceList = getServicesModel.services;
      print("get_services success"+ServiceList.length.toString());

      return GetServicesModel.fromJson(res.data);
    } else {
      print("get_services error");
      getServicesModel = GetServicesModel.fromJson(res.data);
      return GetServicesModel.fromJson(res.data);
    }
  }
}
