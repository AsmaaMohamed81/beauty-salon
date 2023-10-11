
import 'package:beauty_salon/src/MainScreens/home/widget/HomeOfferCard.dart';
import 'package:beauty_salon/src/MainScreens/search%20screen/SearchScreen.dart';
import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Booking/BookingProvider.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'widget/HomeTopRatedCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).allOffersAPI();
    super.initState();
  }
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
             padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30),
             child: Align(
                 alignment: Alignment.bottomCenter,
                 child:  Text(tr("Home"),
                   style: const TextStyle(
                     fontFamily: 'DINNextLTW232',
                     color: Color(0xffffffff),
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                     fontStyle: FontStyle.normal,
                     letterSpacing: 0.528,
                   ),
                   textAlign: TextAlign.center,
                 )
             ),
           )),
             Positioned.fill(
                 child: Align(
                   alignment: Alignment.bottomLeft,
                   child: InkWell(
                     onTap: (){Scaffold.of(context).openEndDrawer();},
                     child: Padding(
                       padding:const EdgeInsets.only(left: 15,right: 15,bottom: 25),
                       child: SizedBox(
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
         )
       ),
       onRefresh: () {
         setState(() {});
       },
       service: Provider.of<HomeProvider>(context, listen: false).allBarbersAPI(),
       body: Consumer<HomeProvider>(builder: (context, snapshot, child) {
         Provider.of<BookingProvider>(context, listen: false).allBarbersModel = snapshot.allBarbersModel;
         return  ListView(
           children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child:  InkWell(
                 onTap: (){
                   // Provider.of<HomeProvider>(context, listen: false).searchBarberAPI("", "");
                   push(SearchScreen());
                 },
                 child: Container(
                   height: 44,
                   decoration:  BoxDecoration(
                       color:const Color(0x0c000000),
                       borderRadius: BorderRadius.circular(10)
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10,right: 10),
                     child: Row(
                       children: [
                         SizedBox(
                           height: 20,width: 20,
                           child: SvgPicture.asset("assets/icon/search.svg"),
                         ),
                         const SizedBox(width: 15,),
                         Text(tr("Search for a barber"),
                             style:const TextStyle(
                               fontFamily: 'DINNextLTW232',
                               color: Color(0xff8a8a8a),
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                               fontStyle: FontStyle.normal,
                             )
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.only(top: 8,bottom: 8,left: 15,right: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(tr("Top Rated"),
                       style:const TextStyle(
                         fontFamily: 'DINNextLTW232',
                         color: Color(0xff202020),
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         fontStyle: FontStyle.normal,
                         letterSpacing: 0.528,

                       )
                   ),
                 ],),
             ),
             const SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
               child: snapshot.allBarbersModel.stores.isEmpty ?
               Container(
                 child: Center(
                 child: Text(tr("No data to display"),
                     style:const TextStyle(
                       fontFamily: 'DINNextLTW232',
                       color: Color(0xff202020),
                       fontSize: 18,
                       fontWeight: FontWeight.w700,
                       fontStyle: FontStyle.normal,
                       letterSpacing: 0.528,

                     )
                 ),
               ),):
               Container(
                 height: 250,
                 child: ListView.builder(
                     reverse: true,
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: snapshot.allBarbersModel.stores.length,
                     itemBuilder: (c, index) => HomeTopRatedCard(store: snapshot.allBarbersModel.stores[index],)),
               ),
             ),
             const SizedBox(height: 10),
             Padding(
               padding: const EdgeInsets.only(top: 8,bottom: 8,left: 15,right: 15),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(tr("Offers and discounts"),
                       style:const TextStyle(
                         fontFamily: 'DINNextLTW232',
                         color: Color(0xff202020),
                         fontSize: 18,
                         fontWeight: FontWeight.w700,
                         fontStyle: FontStyle.normal,
                         letterSpacing: 0.528,

                       )
                   ),
                   InkWell(
                       onTap: (){

                       },
                       child: Text(tr("view all"),
                           style:const TextStyle(
                             fontFamily: 'DINNextLTW232',
                             color: Color(0xff46095c),
                             fontSize: 15,
                             fontWeight: FontWeight.w500,
                             fontStyle: FontStyle.normal,
                             letterSpacing: 0.36,

                           )
                       )
                   ),
                 ],),
             ),
             Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
               child: snapshot.allOffersModel.offers.isEmpty ? Container() :
               Container(
                 height: 150,
                 child: ListView.builder(
                     reverse: true,
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,
                     itemCount: snapshot.allOffersModel.offers.length,
                     itemBuilder: (c, index) => HomeOfferCard(offer: snapshot.allOffersModel.offers[index],)),
               ),
             ),
             SizedBox(height: 40),
           ],
         );
       })


      );
  }
}





