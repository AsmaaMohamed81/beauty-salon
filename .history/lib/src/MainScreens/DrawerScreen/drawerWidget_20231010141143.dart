import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/Repository/lang/language_screen.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/splach_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common.dart';
import '../../app.dart';
import '../auth/login.dart';
import 'aboutUS.dart';
import 'contactUs.dart';
import 'edite Profile/editProfile.dart';
import 'my Reservations screens/MyReservationsScreens.dart';
import 'my orders screens/MyOrdersScreens.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              "assets/images/Drawer.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.3,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2.3,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(125)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(125),
                              child: NetworkUtil.userModel!.member!.mImage ==
                                      null
                                  ? const CustomImageNetwork(
                                      image:
                                          "https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg")
                                  : CustomImageNetwork(
                                      image: AppConfig.MAIN_UserImage_URL +
                                          NetworkUtil
                                              .userModel!.member!.mImage!))),
                      SizedBox(height: 17),
                      Text("${NetworkUtil.userModel!.member!.userName}",
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.432,
                          )),
                    ],
                  ),
                ))
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView(
                // physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  drawerItem(tr("personal page"), Icons.person,
                      () => push(EditProfile()),
                      visable: NetworkUtil.userModel!.token == null),
                  // drawerItem(
                  //     "الصفحة الشخصية", Icons.person, () => push(EditProfile()),
                  //     visable:
                  //     NetworkUtil.userModel.data[0].accessToken != null),
                  drawerItem(tr("Orders"), Icons.article_outlined, () {
                    push(MyOrdersScreens());
                  }),
                  drawerItem(tr("Reservations"), Icons.calendar_today,
                      () => push(MyReservationsScreens())),
                  drawerItem(tr("contact us"), Icons.question_answer,
                      () => push(ContactUs())),
                  drawerItem(tr("who are we"), FontAwesomeIcons.question,
                      () => push(AboutUs())),
                  drawerItem(tr("change the language"), Icons.language, () {
                    pop();
                    push(SplashPage());
                    if (appContext!.locale.languageCode == "en") {
                      supportedLocales[1].languageCode;
                      context.locale = Locale("ar");
                      saveSelectLangVaue("ar");
                      // push(MainPage());
                    } else {
                      supportedLocales[0].languageCode;
                      context.locale = Locale("en");
                      saveSelectLangVaue("en");
                      // push(MainPage());
                    }
                  }),
                  drawerItem(tr("sign out"), FontAwesomeIcons.signInAlt,
                      () async {
                    SharedPreferences _pref =
                        await SharedPreferences.getInstance();
                    _pref.clear();
                    pushAndRemoveUntil(LoginScreen());
                  }, visable: NetworkUtil.userModel!.token == null),
                ],
              ))
            ],
          ),
        )
      ],
    );
  }

  saveSelectLangVaue(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("selectLang", lang);
  }

  Widget drawerItem(String title, IconData icon, Function onTap,
          {bool? visable}) =>
      Visibility(
        visible: visable ?? true,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: InkWell(
            onTap: onTap(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(title,
                    style: TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff3a3a3a),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.36,
                    )),
                SizedBox(width: 10),
                icon != null
                    ? Icon(
                        icon,
                        color: Color(0xff3a3a3a),
                      )
                    : Image.asset(
                        "assets/images/calendar.png",
                        height: 30,
                      )
              ],
            ),
          ),
        ),
      );
}
