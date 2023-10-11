import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Notifactions/notifactionsModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NotifactionsProvider extends ChangeNotifier {
  NetworkUtil _util = new NetworkUtil();

  NotifactionsModel? notifactionsModel;
  myNotificationAPI() async {
    Response res = await _util.post("Api/get_notification",
        body: FormData.fromMap(
            {"user_id_fk": NetworkUtil.userModel!.member!.userId}));
    if (res.statusCode == 200) {
      print("get_notification success");
      notifactionsModel = NotifactionsModel.fromJson(res.data);
      notifyListeners();
      return notifactionsModel;
    } else {
      print("get_notification error");
      notifactionsModel = NotifactionsModel.fromJson(res.data);
      return notifactionsModel;
    }
  }
}
