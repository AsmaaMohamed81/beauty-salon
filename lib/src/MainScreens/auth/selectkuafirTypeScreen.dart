import 'package:beauty_salon/src/Repository/firebaseNotifications.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:beauty_salon/src/MainScreens/auth/widget/authBody.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/MainWidgets/customMove.dart';
import 'package:provider/provider.dart';

import '../mainPage.dart';

class selectkuafirTypeScreen extends StatefulWidget {
  @override
  _selectkuafirTypeScreenState createState() => _selectkuafirTypeScreenState();
}

class _selectkuafirTypeScreenState extends State<selectkuafirTypeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      Provider.of<HomeProvider>(context, listen: false).allOffersAPI();

    LocalNotificationService.initialize(context);

    LocalNotificationService.getFirebaseToken();

    ///gives you the message on which user taps
    ///and it opened the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if(message != null){
        final routeFromMessage = message.data["route"];

        Navigator.of(context).pushNamed(routeFromMessage);
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null){
        print(message.notification.body);
        print(message.notification.title);
      }

      LocalNotificationService.display(message);
    });

    ///When the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMessage);
    });



  }


  @override

  Widget build(BuildContext context) {
    return AuthBody(
        authChild: AnimationLimiter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomMoveList(data: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Container(
                    height: 110,
                    child: Image.asset("assets/images/logo.png")),
              ),
            const SizedBox(height: 50),
             Text(tr("Welcome, what are you looking for?"),
                style:const TextStyle(
                  fontFamily: 'DINNextLTW232',
                  color: Color(0xff202020),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.528,
                ),
               textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        NetworkUtil.KuafirTypeSelected = "1";
                        push(MainPage());},
                    child: Container(
                      width: 155.5,
                      height: 171,
                      decoration:  BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                        ) ],
                      ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height: 90,
                                      child: Image.asset("assets/images/scissors-icon.png")),
                                ),
                                const SizedBox(height: 10),
                                  Text(tr("barber shops"),
                                    style:const TextStyle(
                                      fontFamily: 'DINNextLTW232',
                                      color: Color(0xff3a3a3a),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 0.432,

                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                ),
                    ),
                 InkWell(
                   onTap: () {
                     NetworkUtil.KuafirTypeSelected = "2";
                     push(MainPage());},
                   child: Container(
                      width: 155.5,
                      height: 171,
                      decoration: BoxDecoration(
                        color:const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:const [BoxShadow(
                            color: Color(0x14000000),
                            offset: Offset(0,3),
                            blurRadius: 6,
                            spreadRadius: 0
                        ) ],
                      ),
                     child: Center(
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Column(
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child:  Container(
                                   height: 90,
                                   child: Image.asset("assets/images/hair-dryer-icon.png")),
                             ),
                             const SizedBox(height: 10),
                               Text(tr("Women's Work"),
                                 style:const TextStyle(
                                   fontFamily: 'DINNextLTW232',
                                   color: Color(0xff3a3a3a),
                                   fontSize: 15,
                                   fontWeight: FontWeight.w500,
                                   fontStyle: FontStyle.normal,
                                   letterSpacing: 0.432,

                                 )
                             )
                           ],
                         ),
                       ),
                     ),

                ),
                 )
              ]),
            ),
          )
          ])
        ],
      ),
    ));
  }
}
