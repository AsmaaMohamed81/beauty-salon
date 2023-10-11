import 'package:beauty_salon/src/MainScreens/DrawerScreen/my%20orders%20screens/widget/MyOrdersCard.dart';
import 'package:beauty_salon/src/MainWidgets/app_empty.dart';
import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Reservations/ReservationsProvider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app.dart';


class MyOrdersScreens extends StatefulWidget {
  const MyOrdersScreens({Key key}) : super(key: key);

  @override
  _MyOrdersScreensState createState() => _MyOrdersScreensState();
}

class _MyOrdersScreensState extends State<MyOrdersScreens> {
  void initState() {
    Provider.of<ReservationsProvider>(context, listen: false).orderType = "home";
    Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "";
    Provider.of<ReservationsProvider>(context, listen: false).getOrderStatusAPI();
    super.initState();
  }
  final List<String> items = [tr('neworder'), tr('inprogress'), tr('cancelled'), tr('completed')];
  var lang = appContext.locale.languageCode;
  String selectedValue;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: PreferredSize(
          preferredSize:const Size.fromHeight(105.0),
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
                          tr("Orders"),
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
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                        child:  SizedBox(
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
        service: Provider.of<ReservationsProvider>(context, listen: false).myReservationsAPI(),
        body: Consumer<ReservationsProvider>(builder: (context, snapshot, child) {
          return Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  // decoration:  BoxDecoration(
                  //     border: Border.all(color: Colors.black45),
                  //     color: Color(0xffffffff),
                  //     borderRadius: BorderRadius.circular(10)
                  // ),
                  child: CustomDropdownButton2(
                    hint: tr("status"),
                    dropdownItems: items,
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                        if (lang == "ar"){
                          if ( value == "طلب جديد"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "neworder";
                          }else if ( value == "قيد التنفيذ"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "inprogress";
                          }else if ( value == "ملغاه"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "cancelled";
                          }else if ( value == "مكتمل"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "completed";
                          }
                        }else{
                          if ( value == "New Order"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "neworder";
                          }else if ( value == "In Progress"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "inprogress";
                          }else if ( value == "cancelled"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "cancelled";
                          }else if ( value == "completed"){
                            Provider.of<ReservationsProvider>(context, listen: false).orderStatus = "completed";
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child:
                snapshot.getUserOrdersModel.orders.length == 0 ? AppEmpty():
                ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: snapshot.getUserOrdersModel.orders.length,
                    itemBuilder: (c, index) =>
                        MyOrdersCard(order: snapshot.getUserOrdersModel.orders[index],)),
              ),
              const SizedBox(height: 20,),

            ],
          );
        })
    );
  }
}
