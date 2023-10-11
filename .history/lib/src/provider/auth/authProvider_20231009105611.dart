import 'dart:convert';
import 'dart:io';
import 'package:beauty_salon/src/MainScreens/auth/selectkuafirTypeScreen.dart';
import 'package:beauty_salon/src/MainScreens/mainPage.dart';
import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/custom_progress_dialog.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? userModel;
  NetworkUtil _utils = new NetworkUtil();

  String? email;
  String? password;
  String phone = NetworkUtil.userModel!.member!.userPhone!;
  String? name;
  String? passwordConfirmation;
  File? image;

  login() async {
    CustomProgressDialog().showProgressDialog();
    Response response = await _utils.post("Api/login_app",
        body: FormData.fromMap({"user_email": email, "user_pass": password}));

    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(response.data);
      if (userModel!.success == 1) {
        print("login sucsseful");
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString("userData", json.encode(userModel!.toJson()));
        NetworkUtil.userModel = userModel;
        print("User Data ${_pref.get("userData")}");
        CustomProgressDialog().hidePr();
        pushAndRemoveUntil(selectkuafirTypeScreen());
      } else {
        print("error login");
        CustomAlert().toast(title: userModel!.message);
        CustomProgressDialog().hidePr();
      }
    } else {
      print("error login");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
    }
  }

  forgetPassword() async {
    CustomProgressDialog().showProgressDialog();
    Response response = await _utils.post("Api/ForgetPass",
        body: FormData.fromMap({"user_email": email}));

    if (response.statusCode == 200) {
      print("change_pass sucsseful");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
    } else {
      print("change_pass login");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
    }
  }

  singUp() async {
    CustomProgressDialog().showProgressDialog();
    Response response = await _utils.post("Api/register",
        body: FormData.fromMap({
          "user_phone": phone,
          "user_pass": password,
          "user_name": name,
          "user_email": email,
          "m_image":
              image == null ? null : await MultipartFile.fromFile(image!.path)
        }));
    userModel = UserModel.fromJson(response.data);
    if (response.statusCode == 200) {
      if (userModel!.success == 1) {
        CustomAlert().toast(title: "تم التسجيل بنجاح يمكنك تسجيل الدخول");
        CustomProgressDialog().hidePr();
        // pushAndRemoveUntil(selectkuafirTypeScreen());
        pop();
      } else {
        CustomProgressDialog().hidePr();
        CustomAlert().toast(title: userModel!.message);
      }
    } else {
      print("error login");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
    }
  }

  String? oldPassword;
  changePassword() async {
    CustomProgressDialog().showProgressDialog();
    Response response = await _utils.post("Api/update_pass",
        body: FormData.fromMap({
          "current_pass": oldPassword,
          "user_pass": password,
          "user_id": NetworkUtil.userModel!.member!.userId
        }));

    if (response.statusCode == 200) {
      print("change_pass sucsseful");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
      pushAndRemoveUntil(MainPage(index: 0));
    } else {
      print("change_pass login");
      userModel = UserModel.fromJson(response.data);
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: userModel!.message);
    }
  }

  String editName = NetworkUtil.userModel!.member!.userName!,
      editEmail = NetworkUtil.userModel!.member!.userEmail!;
  editUserData() async {
    CustomProgressDialog().showProgressDialog();
    Response response = await _utils.post("Api/edit_profile",
        body: FormData.fromMap({
          "user_id": NetworkUtil.userModel!.member!.userId!,
          "user_email": NetworkUtil.userModel!.member!.userEmail,
          "user_name": editName,
          "user_phone": phone,
          "m_image":
              image == null ? null : await MultipartFile.fromFile(image!.path)
        }));
    userModel = UserModel.fromJson(response.data);
    if (response.statusCode == 200) {
      print("edit_profile sucsseful");
      print("edit_profile sucsseful" + phone);
      CustomProgressDialog().hidePr();
      if (response.data["success"] == 1) {
        NetworkUtil.userModel!.member!.userName = editName;
        NetworkUtil.userModel!.member!.userEmail = editEmail;
        NetworkUtil.userModel!.member!.userPhone = phone;
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString("userData", json.encode(userModel!.toJson()));
        NetworkUtil.userModel = userModel;
        print("edit_profile Data ${_pref.get("userData")}");
        CustomAlert().toast(title: "تم تعديل البيانات بنجاح");
        pushAndRemoveUntil(MainPage(index: 0));
      } else {
        CustomAlert().toast(title: response.data["message"]);
      }
    } else {
      print("edit_profile login");
      CustomProgressDialog().hidePr();
      CustomAlert().toast(title: response.data["message"]);
    }
  }
}
