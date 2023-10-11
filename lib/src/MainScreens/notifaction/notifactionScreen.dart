import 'package:beauty_salon/src/MainWidgets/app_empty.dart';
import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/provider/Notifactions/NotifactionsProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotifactionScreen extends StatefulWidget {
  @override
  _NotifactionScreenState createState() => _NotifactionScreenState();
}

class _NotifactionScreenState extends State<NotifactionScreen> {
  // String title = "هذه المكان مخصص لوضع عنوان الإشعار";
  // String content =
  //     "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، حيث يمكنك أن  مثل هذا النص ";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(105.0),
            child: Stack(
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/Rectangle 3703.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        tr("Notifications"),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xffffffff),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.528,
                        ),
                        textAlign: TextAlign.center,
                      )),
                )),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
                      child: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/images/Group 717.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            )),
        onRefresh: () {
          setState(() {});
        },
        service: Provider.of<NotifactionsProvider>(context, listen: false)
            .myNotificationAPI(),
        body:
            Consumer<NotifactionsProvider>(builder: (context, snapshot, child) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 30),
                  child: snapshot.notifactionsModel!.notification!.length == 0
                      ? AppEmpty()
                      : ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount:
                              snapshot.notifactionsModel!.notification!.length,
                          itemBuilder: (c, index) => Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 15, top: 10),
                              child: Container(
                                // width: 151,
                                // height: 207,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x0c060dd9),
                                      offset: Offset(0, 5),
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot.notifactionsModel!
                                                    .notification![index].dateAr
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              snapshot.notifactionsModel!
                                                  .notification![index].title!,
                                              style: TextStyle(
                                                fontFamily: 'DINNextLTW232',
                                                color: Color(0xff46095c),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: 0.432,
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  60,
                                              child: Text(
                                                  snapshot
                                                      .notifactionsModel!
                                                      .notification![index]
                                                      .body!,
                                                  style: TextStyle(
                                                    fontFamily: 'DINNextLTW232',
                                                    color: Color(0xff3a3a3a),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: 0.36,
                                                  ))),
                                        ),
                                        // Divider()
                                      ]),
                                ),
                              )))));
        }));
  }
}
