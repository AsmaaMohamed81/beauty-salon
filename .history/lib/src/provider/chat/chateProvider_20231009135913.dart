import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ChateProvider extends ChangeNotifier {
  ContactUsModel? contactUsModel;
  NetworkUtil _utils = new NetworkUtil();

  sendMessage(String fromUserId, String toUserId, String message) async {
    Response response = await _utils.post("Chat/save_message",
        body: FormData.fromMap({
          "from_user_id": fromUserId,
          "to_user_id": toUserId,
          "message": message
        }));

    if (response.statusCode == 200) {
      contactUsModel = ContactUsModel.fromJson(response.data);
      if (contactUsModel!.success == 1) {
        print("sendMessage sucsseful");
        // CustomProgressDialog().hidePr();
      } else {
        print("error sendMessage");
        CustomAlert().toast(title: contactUsModel!.message);
        // CustomProgressDialog().hidePr();
      }
    } else {
      print("error login");
      contactUsModel = ContactUsModel.fromJson(response.data);
      // CustomProgressDialog().hidePr();
      CustomAlert().toast(title: contactUsModel!.message);
    }
  }
}
