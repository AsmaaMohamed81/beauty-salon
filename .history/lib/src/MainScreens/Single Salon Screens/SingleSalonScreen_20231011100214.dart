import 'package:beauty_salon/src/MainScreens/ChatRoom/chat/chat_screen.dart';
import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common.dart';
import '../../app.dart';
import 'Create  new order Screen/CreateNewOrderScreen.dart';
import 'appointment Booking screen/AppointmentBookingScreen.dart';
import 'comments Screen/commentsScreen.dart';

class SingleSalonScreen extends StatefulWidget {
  final Store? store;
  const SingleSalonScreen({Key? key, this.store}) : super(key: key);

  @override
  _SingleSalonScreenState createState() => _SingleSalonScreenState();
}

class _SingleSalonScreenState extends State<SingleSalonScreen> {
  var rating = 0.0;
  double? ratingValue;
  final rateComment = TextEditingController();
  var lang = appContext!.locale.languageCode;
  static void openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl) != null) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    rating = widget.store!.rating.toDouble();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(105.0),
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
                        lang == "ar"
                            ? widget.store!.storeName!.length > 25
                                ? '${widget.store!.storeName!.substring(0, 25)}...'
                                : widget.store!.storeName!
                            : widget.store!.storeNameEn!.length > 25
                                ? '${widget.store!.storeNameEn!.substring(0, 25)}...'
                                : widget.store!.storeNameEn!,
                        style: TextStyle(
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
                      pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "assets/images/Group 703.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            )),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              AppConfig.MAIN_Image_URL +
                                  widget.store!.mainImage!,
                              width: 110,
                              height: 160,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(tr("You can rate the barber"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xff3a3a3a),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.312,
                              )),
                          SizedBox(
                              width: 200,
                              height: 32,
                              child: Center(
                                child: SmoothStarRating(
                                  rating: rating,
                                  size: 30,
                                  color: Colors.amber,
                                  borderColor: const Color(0xff202020),
                                  filledIconData: Icons.star,
                                  halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  onRatingChanged: (value) {
                                    print("rating value -> $value");
                                    ratingValue = value;
                                  },
                                ),
                              )),
                          Container(
                            height: 50,
                            width: 180,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xff707070)),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              minLines: null,
                              // maxLines: 7,
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xff8a8a8a),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: InputDecoration(
                                disabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: tr("rate2"),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              controller: rateComment,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // rate
                                  if (ratingValue != null) {
                                    if (NetworkUtil.userModel!.member!.userId !=
                                        null) {
                                      Provider.of<HomeProvider>(context,
                                              listen: false)
                                          .addRateApi(
                                              widget.store!.storeId!,
                                              NetworkUtil
                                                  .userModel!.member!.userId!,
                                              ratingValue.toString(),
                                              rateComment.text ?? "");
                                    }
                                  } else {
                                    CustomAlert().toast(
                                        title: "You must evaluate first");
                                  }
                                },
                                child: Container(
                                  width: 90,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xffd6246a),
                                          Color(0xff46095c)
                                        ],
                                        stops: [0, 1],
                                        begin: Alignment(-0.99, -0.10),
                                        end: Alignment(0.99, 0.10),
                                      )),
                                  child: Center(
                                    child: Text(tr("rate"),
                                        style: const TextStyle(
                                          fontFamily: 'DINNextLTW232',
                                          color: Color(0xffffffff),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  push(CommentsScreen(
                                    storeIdFk: widget.store!.storeId,
                                  ));
                                },
                                child: Container(
                                  width: 90,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xffd6246a),
                                          Color(0xff46095c)
                                        ],
                                        stops: [0, 1],
                                        begin: Alignment(-0.99, -0.10),
                                        end: Alignment(0.99, 0.10),
                                        // angle: 96,
                                        // scale: undefined,
                                      )),
                                  child: Center(
                                    child: Text(tr("view ratings"),
                                        style: const TextStyle(
                                          fontFamily: 'DINNextLTW232',
                                          color: Color(0xffffffff),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            StoreName: widget.store!.storeName,
                                            StoreId: widget.store!.storeId,
                                          )));
                            },
                            child: Container(
                              width: 180,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffd6246a),
                                      Color(0xff46095c)
                                    ],
                                    stops: [0, 1],
                                    begin: Alignment(-0.99, -0.10),
                                    end: Alignment(0.99, 0.10),
                                    // angle: 96,
                                    // scale: undefined,
                                  )),
                              child: Center(
                                child: Text(tr("Messaging"),
                                    style: const TextStyle(
                                      fontFamily: 'DINNextLTW232',
                                      color: Color(0xffffffff),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffe9e8e8),
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Text(tr("shop address"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff202020),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.528,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11.0),
                          child: Image.asset(
                            "assets/images/pin-icon.png",
                            fit: BoxFit.fill,
                          ),
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Flexible(
                        child: Text(
                            lang == "ar"
                                ? widget.store!.address!
                                : widget.store!.addressEn!,
                            style: TextStyle(
                              fontFamily: 'DINNextLTW23',
                              color: Color(0xff3a3a3a),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.36,
                            ))),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        openMap(double.parse(widget.store!.latitude!),
                            double.parse(widget.store!.longtitude!));
                      },
                      child: Container(
                        width: 170,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xffd6246a), Color(0xff46095c)],
                              stops: [0, 1],
                              begin: Alignment(-0.99, -0.10),
                              end: Alignment(0.99, 0.10),
                              // angle: 96,
                              // scale: undefined,
                            )),
                        child: Center(
                          child: Text(tr("Show location on the map"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xffffffff),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffe9e8e8),
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Text(tr("times of work"),
                    style: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff202020),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.528,
                    )),
              ),
              widget.store!.storesDays!.length == 0
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      addAutomaticKeepAlives: true,
                      itemCount: widget.store!.storesDays!.length,
                      itemBuilder: (c, index) => Padding(
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 20),
                        child: Row(
                          children: [
                            Container(
                                width: 24,
                                height: 24,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11.0),
                                  child: const Icon(Icons.access_time),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                                lang == "ar"
                                    ? widget.store!.storesDays![index].dayN
                                            .toString() +
                                        " - " +
                                        widget.store!.storesDays![index].fromT
                                            .toString() +
                                        tr("to") +
                                        widget.store!.storesDays![index].toT
                                            .toString()
                                    : widget.store!.storesDays![index].dayNEn
                                            .toString() +
                                        " - " +
                                        widget.store!.storesDays![index].fromT
                                            .toString() +
                                        tr("to") +
                                        widget.store!.storesDays![index].toT
                                            .toString(),
                                style: TextStyle(
                                  fontFamily: 'DINNextLTW23',
                                  color: Color(0xff3a3a3a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.36,
                                ))
                          ],
                        ),
                      ),
                    ),
              const Divider(
                color: Color(0xffe9e8e8),
                height: 1,
              ),
              widget.store!.storesServices!.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: Text(tr("Services"),
                          style: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff202020),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.528,
                          )),
                    ),
              widget.store!.storesServices!.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GridView(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 150.0,
                        ),
                        children: List<Widget>.generate(
                            widget.store!.storesServices!.length, (int i) {
                          return Builder(builder: (BuildContext context) {
                            // Text('$i'),
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        // child: Image.asset("assets/images/grooming.png"),
                                        child: Image.network(
                                          AppConfig.MAIN_ImageServices_URL +
                                              widget.store!.storesServices![i]
                                                  .fe2AImage!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          lang == "ar"
                                              ? widget.store!.storesServices![i]
                                                  .fe2AName!
                                              : widget.store!.storesServices![i]
                                                  .fe2ANameEn!,
                                          style: TextStyle(
                                            fontFamily: 'DINNextLTW232',
                                            color: Color(0xff3a3a3a),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.36,
                                          )),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          widget.store!.storesServices![i]
                                                  .servicePrice! +
                                              " " +
                                              tr("SAR"),
                                          style: TextStyle(
                                            fontFamily: 'DINNextLTW23',
                                            color: Color(0xffd6246a),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.36,
                                          ))
                                    ],
                                  )),
                            );
                          });
                        }),
                      ),
                    ),
              const Divider(
                color: Color(0xffe9e8e8),
                height: 1,
              ),
              widget.store!.storesImages!.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: Text(tr("Photo Gallery"),
                          style: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff202020),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.528,
                          )),
                    ),
              widget.store!.storesImages!.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: GridView(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 150.0,
                        ),
                        children: List<Widget>.generate(
                            widget.store!.storesImages!.length, (int i) {
                          return Builder(builder: (BuildContext context) {
                            // Text('$i'),
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      AppConfig.MAIN_Image_URL +
                                          widget.store!.storesImages![i]
                                              .imageName!,
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            );
                          });
                        }),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 35, bottom: 30, left: 20, right: 20),
                child: InkWell(
                  onTap: () {
                    push(CreateNewOrderScreen(
                      fromMain: false,
                      storeId: widget.store!.storeId!,
                      storesServices: widget.store!.storesServices!,
                    ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 165,
                        height: 38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xffd6246a), Color(0xff46095c)],
                              stops: [0, 1],
                              begin: Alignment(-0.99, -0.10),
                              end: Alignment(0.99, 0.10),
                              // angle: 96,
                              // scale: undefined,
                            )),
                        child: Center(
                          child: Text(tr("Request a home visit"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xffffffff),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          push(AppointmentBookingScreen(
                            storeId: widget.store!.storeId,
                            storesServices: widget.store!.storesServices,
                          ));
                        },
                        child: Container(
                          width: 165,
                          height: 38,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [Color(0xffd6246a), Color(0xff46095c)],
                                stops: [0, 1],
                                begin: Alignment(-0.99, -0.10),
                                end: Alignment(0.99, 0.10),
                                // angle: 96,
                                // scale: undefined,
                              )),
                          child: Center(
                            child: Text(tr("Book an appointment"),
                                style: const TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xffffffff),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ]));
  }
}
