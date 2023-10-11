import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/genral/aboutModle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AboutProvider extends ChangeNotifier {
  NetworkUtil _util = new NetworkUtil();
  int itemSelect = 1;
  AboutModle? aboutModle;

  aboutApp() async {
    Response res = await _util.get("Api/getAppinfo");
    if (res.statusCode == 200) {
      print("getAppinfo success");
      aboutModle = AboutModle.fromJson(res.data);
      print("jhgfd" + aboutModle!.appInfo!.aboutApp);
      return AboutModle.fromJson(res.data);
    } else {
      print("getAppinfo error");
      aboutModle = AboutModle.fromJson(res.data);
      return AboutModle.fromJson(res.data);
    }
  }
}
