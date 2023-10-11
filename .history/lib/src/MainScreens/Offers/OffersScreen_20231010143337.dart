import 'package:beauty_salon/src/MainScreens/Single%20Salon%20Screens/SingleSalonOfferScreen.dart';
import 'package:beauty_salon/src/MainWidgets/app_empty.dart';
import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        tr("Offers"),
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
        service:
            Provider.of<HomeProvider>(context, listen: false).allOffersAPI(),
        body: Consumer<HomeProvider>(builder: (context, snapshot, child) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 30),
                  child: snapshot.allOffersModel!.offers!.length == 0
                      ? AppEmpty()
                      : ListView.builder(
                          addAutomaticKeepAlives: true,
                          itemCount: snapshot.allOffersModel!.offers!.length,
                          itemBuilder: (c, index) => InkWell(
                                onTap: () => push(SingleSalonOfferScreen(
                                  offer:
                                      snapshot.allOffersModel!.offers![index],
                                )),
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0, left: 15, top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Color(0x14000000),
                                              offset: Offset(0, 3),
                                              blurRadius: 6,
                                              spreadRadius: 0)
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot
                                                      .allOffersModel!
                                                      .offers![index]
                                                      .storeName!,
                                                  style: TextStyle(
                                                    fontFamily: 'DINNextLTW232',
                                                    color: Color(0xff46095c),
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                    letterSpacing: 0.432,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Text(
                                                      snapshot
                                                          .allOffersModel!
                                                          .offers![index]
                                                          .offerDetails!,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'DINNextLTW232',
                                                        color:
                                                            Color(0xff3a3a3a),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        letterSpacing: 0.36,
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 7,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          tr("the end of the show") +
                                                              snapshot
                                                                  .allOffersModel!
                                                                  .offers![
                                                                      index]
                                                                  .toDate!,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'DINNextLTW232',
                                                            color: Color(
                                                                0xff8a8a8a),
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing: 0.36,
                                                          )),
                                                      Text(
                                                          snapshot
                                                                  .allOffersModel!
                                                                  .offers![
                                                                      index]
                                                                  .offerPrice! +
                                                              "%خصم ",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'DINNextLTW232',
                                                            color: Color(
                                                                0xffd6246a),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            letterSpacing:
                                                                0.432,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              // width: 89,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: CustomImageNetwork(
                                                  image: AppConfig
                                                          .MAIN_Image_offer_URL +
                                                      snapshot
                                                          .allOffersModel!
                                                          .offers![index]
                                                          .offerImg!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ))));
        }));
  }
}
