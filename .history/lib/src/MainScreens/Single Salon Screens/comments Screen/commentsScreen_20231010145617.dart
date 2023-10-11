import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

class CommentsScreen extends StatefulWidget {
  final String? storeIdFk;
  const CommentsScreen({Key? key, this.storeIdFk}) : super(key: key);
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                        tr("view ratings"),
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
        onRefresh: () {
          setState(() {});
        },
        service: Provider.of<HomeProvider>(context, listen: false)
            .AllCommentsRatesAPI(widget.storeIdFk),
        body: Consumer<HomeProvider>(builder: (context, snapshot, child) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 30),
                  child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount: snapshot.allCommentsRatesModel!.rating!.length,
                      itemBuilder: (c, index) => Padding(
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
                                        snapshot.allCommentsRatesModel!
                                            .rating![index].userName!,
                                        style: TextStyle(
                                          fontFamily: 'DINNextLTW232',
                                          color: Color(0xff46095c),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.432,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          snapshot.allCommentsRatesModel!
                                                  .rating![index].comment ??
                                              "",
                                          style: TextStyle(
                                            fontFamily: 'DINNextLTW232',
                                            color: Color(0xff3a3a3a),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.36,
                                          )),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                          snapshot.allCommentsRatesModel!
                                              .rating![index].date!,
                                          style: TextStyle(
                                            fontFamily: 'DINNextLTW232',
                                            color: Color(0xff8a8a8a),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.312,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                      width: 100,
                                      height: 32,
                                      child: Center(
                                        child: SmoothStarRating(
                                          rating: double.parse(snapshot
                                              .allCommentsRatesModel!
                                              .rating![index]
                                              .rate!),
                                          onRatingChanged: (rating) {},
                                          size: 17,
                                          color: Colors.amber,
                                          borderColor: const Color(0xff202020),
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          starCount: 5,
                                          allowHalfRating: true,
                                          spacing: 2.0,
                                          onRated: (value) {},
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )))));
        }));
  }
}
