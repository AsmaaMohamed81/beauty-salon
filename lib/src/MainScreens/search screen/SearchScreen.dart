import 'package:beauty_salon/src/MainScreens/home/widget/homeSearchWidget.dart';
import 'package:beauty_salon/src/MainScreens/search%20screen/widget/AltasnifHasabDialog.dart';
import 'package:beauty_salon/src/MainScreens/search%20screen/widget/SearchCard.dart';
import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final lang = appContext.locale.languageCode;
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).getServicesAPI();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        onRefresh: () {
          setState(() {});
        },
        service: Provider.of<HomeProvider>(context, listen: false).searchBarberAPI(),
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
                padding:const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(tr("All barbers"),
                      style:const TextStyle(
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
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 25),
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
      body: Consumer<HomeProvider>(builder: (context, snapshot, child) {
        return  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: HomeSearchWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return   AltasnifHasabDialog();
                          });
                    },
                    child: Row(
                      children: [
                        Text(tr("Category by"),
                            style:const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff46095c),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.432,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset("assets/images/filterIcon.png"),
                        ),
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     showDialog(
                  //         context: context,
                  //         builder: (_) {
                  //           return SortByDialog();
                  //         });
                  //   },
                  //   child: Row(
                  //     children: [
                  //       // Text(tr("Sort by"),
                  //       Text(tr("الترتيب حسب"),
                  //           style:const TextStyle(
                  //             fontFamily: 'DINNextLTW232',
                  //             color: Color(0xff46095c),
                  //             fontSize: 15,
                  //             fontWeight: FontWeight.w500,
                  //             fontStyle: FontStyle.normal,
                  //             letterSpacing: 0.432,
                  //           )),
                  //       const SizedBox(
                  //         width: 15,
                  //       ),
                  //       SizedBox(
                  //         width: 25,
                  //         height: 25,
                  //         child: Image.asset("assets/images/sortIcon.png"),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
                child: snapshot.searchBarberList.length == 0 ? Center(child:
                  Text(tr("No data to display"),
                    style:const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff46095c),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.432,
                    )),):
                ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: snapshot.searchBarberList.length,
                    itemBuilder: (c, index) => Padding(
                        padding:
                        const EdgeInsets.only(right: 15.0, left: 15, top: 10),
                        child: SearchCard(model: snapshot.searchBarberList[index],lang: lang.toString() ,))))
          ],
        );
      })

    );
  }
}
