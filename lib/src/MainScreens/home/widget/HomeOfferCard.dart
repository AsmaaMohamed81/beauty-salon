import 'package:beauty_salon/src/MainScreens/Single%20Salon%20Screens/SingleSalonOfferScreen.dart';
import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/modle/Home/AllOffersModel.dart';
import 'package:flutter/material.dart';

import '../../../../common.dart';

class HomeOfferCard extends StatelessWidget {
  final Offer offer;
  const HomeOfferCard({Key key,this.offer,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>push( SingleSalonOfferScreen(offer: offer,)),
        child: Container(
            width: 266,
           decoration:  BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(
                  color: Color(0x14000000),
                  offset: Offset(0,3),
                  blurRadius: 6,
                  spreadRadius: 0
              ) ],
            ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 90,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child:
                    // Image.asset(
                    //   "assets/images/1.png",
                    //   fit: BoxFit.fill,
                    // ),
                    CustomImageNetwork(image: AppConfig.MAIN_Image_offer_URL+ offer.offerImg),

                  ),
                ),
              ),
              // SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(
                       width: 140,
                       child: Text(offer.storeName,
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff46095c),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          ),textAlign: TextAlign.center,
                    ),
                     ),
                    SizedBox(height: 10,),
                     Text(offer.offerPrice +"%خصم ",
                        style: TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xffd6246a),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.432,

                        )
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
