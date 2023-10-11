
import 'package:beauty_salon/common.dart';
import 'package:beauty_salon/src/MainScreens/Single%20Salon%20Screens/SingleSalonScreen.dart';
import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:flutter/material.dart';


class SearchCard extends StatelessWidget {
  final Store model;
  final String lang;
  const SearchCard({Key key,this.model,this.lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: ()=>push( SingleSalonScreen(store: model,)),
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
                    width: MediaQuery.of(context).size.width,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child:
                    // Image.asset(
                    //   "assets/images/4.png",
                    //   fit: BoxFit.fill,
                    // ),
                    CustomImageNetwork(
                        image:AppConfig.MAIN_Image_URL + model.mainImage),
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
                            child:CustomImageNetwork(
                                image:AppConfig.MAIN_Image_URL + model.mainImage),
                            // Image.asset("assets/images/4.png", fit: BoxFit.fill,),
                          )
                        ),
                        const SizedBox(width: 5,),
                         Text(lang == "ar" ? model.storeName :  model.storeNameEn,
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
                           Text(model.rating.toString(),
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
                            child: Image.asset("assets/images/pin-icon.png", fit: BoxFit.fill,),
                          )
                        ),
                        const SizedBox(width: 5,),
                        Text(lang == "ar" ? model.address : model.addressEn,
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
