import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common.dart';
import '../../app.dart';
import 'chat/chat_screen.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  var lang = appContext!.locale.languageCode;
  String? selectedValue;
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
                        tr("My Correspondence"),
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
        service:
            Provider.of<HomeProvider>(context, listen: false).allBarbersAPI(),
        body: Consumer<HomeProvider>(builder: (context, snapshot, child) {
          return SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 8, bottom: 30),
                  child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemCount: snapshot.allBarbersModel!.stores!.length,
                      itemBuilder: (c, index) => Padding(
                          padding: const EdgeInsets.only(
                              right: 15.0, left: 15, top: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            StoreName: snapshot.allBarbersModel!
                                                .stores![index].storeName,
                                            StoreId: snapshot.allBarbersModel!
                                                .stores![index].storeId,
                                          )));
                            },
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
                                          snapshot.allBarbersModel!
                                              .stores![index].storeName!,
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
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          border: Border.all(
                                              color: Colors.white, width: 3),
                                          borderRadius:
                                              BorderRadius.circular(80)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(80),

                                        //   child: CustomImageNetwork(
                                        //       image:
                                        //       "https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg"),
                                        child: Image.network(
                                          AppConfig.MAIN_Image_URL +
                                              snapshot.allBarbersModel!
                                                  .stores![index].mainImage!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )))));
        }));
  }
}
