
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app.dart';

class AltasnifHasabDialog extends StatefulWidget {
  @override
  _AltasnifHasabDialogState createState() => new _AltasnifHasabDialogState();
}

class _AltasnifHasabDialogState extends State<AltasnifHasabDialog> {
  bool _accept = false;
  final lang = appContext!.locale.languageCode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 350,
        child: Column(
          children: <Widget>[
            Row(
              children: [
                InkWell(
                  onTap: () {
                    pop();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xffd6246a), Color(0xff46095c)],
                          stops: [0, 1],
                          begin: Alignment(-0.77, -0.64),
                          end: Alignment(0.77, 0.64),
                        )),
                    child: const Center(
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                        )),
                  ),
                ),
                const SizedBox(width: 45,),
                 Text(tr("Category by"),
                    style:const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff202020),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.528,

                    )
                )
              ],
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: Provider.of<HomeProvider>(context, listen: false).ServiceList.length < 0 ? Center(child:
              Text(tr("No data to display"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff46095c),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.432,
                  )),):
              Container(
                height: 300,
                width: 250,
                child: ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount:  Provider.of<HomeProvider>(context, listen: false).ServiceList.length,
                    itemBuilder: (c, index) => Padding(
                        padding:
                        const EdgeInsets.only(right: 15.0, left: 15, top: 10),
                        child:  Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff46095C)),
                          child: CheckboxListTile(
                              value: Provider.of<HomeProvider>(context, listen: false).ServiceList[index].isSelected == null ? _accept :
                              Provider.of<HomeProvider>(context, listen: false).ServiceList[index].isSelected,
                              onChanged: (value) {
                                setState(() {
                                  for(var i = 0; i < Provider.of<HomeProvider>(context, listen: false).ServiceList.length; i++){
                                    Provider.of<HomeProvider>(context, listen: false).ServiceList[i].isSelected = false;
                                  }
                                  Provider.of<HomeProvider>(context, listen: false).service_id_fk = Provider.of<HomeProvider>(context, listen: false).ServiceList[index].fe2AId;
                                  Provider.of<HomeProvider>(context, listen: false).ServiceList[index].isSelected = !Provider.of<HomeProvider>(context, listen: false).ServiceList[index].isSelected;
                                });
                              },
                              activeColor:const Color(0xff46095C),
                              checkColor: Colors.white,
                              dense: true,
                              title:  Text( lang == "ar" ?
                                  Provider.of<HomeProvider>(context, listen: false).ServiceList[index].fe2AName :
                                  Provider.of<HomeProvider>(context, listen: false).ServiceList[index].fe2ANameEn,
                                  style: TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xff3a3a3a),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )
                              )
                          ),
                        ),
                    )),
              ),
            )



          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              Provider.of<HomeProvider>(context, listen: false).searchBarberAPI();
              pop();
            },
            child: Container(
              width: 280,
              height: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Color(0xffd6246a), Color(0xff46095c)],
                  stops: [0, 1],
                  begin: Alignment(-1.00, -0.07),
                  end: Alignment(1.00, 0.07),
                ),
              ),
              child:  Center(
                child: Text(tr("Category"),
                    style: TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xffffffff),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
        )
      ],

    );
  }
}
