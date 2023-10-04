import 'dart:convert';
import 'dart:io';

import 'package:beauty_salon/src/Repository/firebaseNotifications.dart';
import 'package:beauty_salon/src/Repository/lang/language_screen.dart';
import 'package:beauty_salon/src/app.dart';
import 'package:beauty_salon/src/modle/auth/userModle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/Repository/networkUtlis.dart';

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');
final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await init();
  // if (Platform.isIOS) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  await EasyLocalization.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String? data = _prefs.getString("userData");
  String? selectLang = _prefs.getString('selectLang');
  print(data);
  print(selectLang);
  if (selectLang != null) {
    NetworkUtil.selectedLang = true;
  } else {
    NetworkUtil.selectedLang = false;
  }
  if (data != null) {
    NetworkUtil.userModel = UserModel.fromJson(json.decode(data));
    print(" user data ${NetworkUtil.userModel.member} done");
  } else {
    NetworkUtil.userModel = UserModel(
token: ,
        success: null,
        message: null,
        member: Member(
            userId: null,
            userCity: null,
            userEmail: null,
            userName: null,
            userPhone: null,
            status: null));
  }

  runApp(
    EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/langs',
// if device language not supported
        fallbackLocale: supportedLocales[0],
        saveLocale: true,
        useOnlyLangCode: true,
        child: MyApp()),
  );
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
