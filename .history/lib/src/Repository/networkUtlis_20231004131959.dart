import 'package:beauty_salon/main.dart';
import 'package:beauty_salon/src/MainScreens/auth/login.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/app.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common.dart';

class NetworkUtil with ChangeNotifier {
  static NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  CancelToken cancelToken = CancelToken();
  factory NetworkUtil() => _instance;
  static UserModel? userModel;
  static bool? selectedLang;
  static String? KuafirTypeSelected;

  Dio dio = Dio();
  Future<Response> get(String url, {Map? headers}) async {
    var response;
    try {
      dio.options.baseUrl = AppConfig.MAIN_API_URL;
      response = await dio.get(url,
          options: Options(
              headers: headers as Map<String, dynamic>? ??
                  {
                    "Accept": "application/json",
                    "content-type": "application/json",
                    "lang": appContext?.locale.languageCode,
                    "type": KuafirTypeSelected,
                    "Authorization":
                        "Bearer ${userModel == null ? null : userModel!.token!}",
                  }));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return handleResponse(response, navigator.currentContext);
  }

  Future<Response> post(String url,
      {Map headers, FormData body, encoding}) async {
    var response;
    dio.options.baseUrl = AppConfig.MAIN_API_URL;
    try {
      response = await dio.post(
        url,
        data: body,
        options: Options(
            headers: headers ??
                {
                  "Accept": "application/json",
                  "content-type": "application/json",
                  "lang": appContext.locale.languageCode,
                  "type": KuafirTypeSelected, //1 as man  2 as women
                },
            requestEncoder: encoding),
        onSendProgress: (int sent, int total) {
          final progress = sent / total;
          print('progress: $progress ($sent/$total)');
        },
      );
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return handleResponse(response, navigator.currentContext);
  }

  Future<Response> handleResponse(
      Response response, BuildContext context) async {
    if (response.data.runtimeType == String) {
      return Response(
          statusCode: 102,
          data: {
            "mainCode": 0,
            "code": 102,
            "data": null,
            "error": [
              {"key": "internet", "value": "هناك خطا يرجي اعادة المحاولة"}
            ]
          },
          requestOptions: null);
    } else {
      final int statusCode = response.statusCode;
      print("response: " + response.toString());
      print("statusCode: " + statusCode.toString());
      if (statusCode >= 200 && statusCode < 300) {
        return response;
      } else if (statusCode == 405) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        userModel = null;
        pushAndRemoveUntil(LoginScreen());
        return Response(
            statusCode: 405,
            data: {
              "mainCode": 0,
              "code": 405,
              "data": null,
              "error": [
                {"key": "internet", "value": "انتهت مده التسجيل"}
              ]
            },
            requestOptions: null);
      } else {
        return response;
      }
    }
  }
}
