
import 'package:beauty_salon/common.dart';
import 'package:beauty_salon/src/MainScreens/Single%20Salon%20Screens/SingleSalonScreen.dart';
import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/app.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:flutter/material.dart';


class HomeTopRatedCard extends StatelessWidget {
  final Store ?store;

  const HomeTopRatedCard({? key,this.store,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var lang = appContext.locale.languageCode;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>push( SingleSalonScreen(store: store,)),
        child: Container(
            width: 270,
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
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 125,
                    width: 270,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(AppConfig.MAIN_Image_URL+store.mainImage,fit: BoxFit.fill,),
                    )
                  ),
                ),
              ),
              SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            decoration:  const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11.0),
                            child: CustomImageNetwork(image: AppConfig.MAIN_Image_URL+store.mainImage),

                            // child: Image.asset("assets/images/4.png", fit: BoxFit.fill,),
                          )
                        ),
                        const SizedBox(width: 5,),
                        Text( lang == "ar" ?
                        store.storeName.length > 20 ? '${store.storeName.substring(0, 20)}...' : store.storeName
                            :store.storeNameEn.length > 20 ? '${store.storeNameEn.substring(0, 20)}...' : store.storeNameEn,
                            style: TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff46095c),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.36,
                            )
                        )
                      ],
                    ),
                     Row(
                       children: [
                          SizedBox(
                             width: 14,
                             height: 13.5,
                            child:Image.asset("assets/images/rate.png",fit: BoxFit.fill,)
                         ),
                          const SizedBox(width: 5),
                           Text(store.rating.toDouble().toStringAsFixed(1),
                             style: TextStyle(
                               fontFamily: 'DINNextLTW232',
                               color: Color(0xffffad1e),
                               fontSize: 15,
                               fontWeight: FontWeight.w500,
                               fontStyle: FontStyle.normal,
                               letterSpacing: 0.36,

                             )
                         )
                       ],
                     )
                  ],
                ),
              ),
              const SizedBox(height: 6,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            decoration:  const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11.0),
                            child: Image.asset("assets/images/pin-icon.png", fit: BoxFit.fill,),
                          )
                        ),
                        const SizedBox(width: 5,),

                         Text( lang == "ar" ?
                             store.address.length > 40 ? '${store.address.substring(0, 40)}...' : store.address
                             :store.addressEn.length > 40 ? '${store.addressEn.substring(0, 40)}...' : store.addressEn,
                              style: TextStyle(
                              fontFamily: 'DINNextLTW23',
                              color: Color(0xff3a3a3a),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.312,

                            )
                        )
                      ],
                    ),

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
