
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:beauty_salon/src/provider/Booking/BookingProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app.dart';


class ShowServicesDialog extends StatefulWidget {
  final  List<StoresService> storesServices;
  const ShowServicesDialog({Key key,this.storesServices}) : super(key: key);
  @override
  _ShowServicesDialogState createState() => new _ShowServicesDialogState();
}

class _ShowServicesDialogState extends State<ShowServicesDialog> {
  bool _accept = false;
  final lang = appContext.locale.languageCode;

  void _itemChange(StoresService serviceSelect, bool isSelected) {
    setState(() {
      if (isSelected) {
        Provider.of<BookingProvider>(context, listen: false).serviceSelected.add(serviceSelect);
        Provider.of<BookingProvider>(context, listen: false).calculatTotalServicePrice();
      } else {
        Provider.of<BookingProvider>(context, listen: false).serviceSelected.remove(serviceSelect);
        Provider.of<BookingProvider>(context, listen: false).calculatTotalServicePrice();
      }
    });
  }
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
                 Text(tr("Select the service"),
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
              child: widget.storesServices.length < 0 ? Center(child:
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
                    itemCount:  widget.storesServices.length,
                    itemBuilder: (c, index) => Padding(
                        padding:
                        const EdgeInsets.only(right: 0, left: 0, top: 10),
                        child:  Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff46095C)),
                          child: CheckboxListTile(
                              value: widget.storesServices[index].isSelected == null ? _accept :
                              widget.storesServices[index].isSelected,
                              onChanged: (value) {
                                setState(() {
                                  for(var i = 0; i <  widget.storesServices.length; i++){
                                    if( widget.storesServices[i].isSelected == null){
                                      widget.storesServices[i].isSelected = false;
                                    }
                                  }
                                  widget.storesServices[index].isSelected = !widget.storesServices[index].isSelected;
                                  _itemChange(widget.storesServices[index], widget.storesServices[index].isSelected);
                                  print("salmoun"+  Provider.of<BookingProvider>(context, listen: false).serviceSelected.length.toString());
                                });
                              },
                              activeColor:const Color(0xff46095C),
                              checkColor: Colors.white,
                              dense: true,
                              title:  Text( lang == "ar" ?
                              widget.storesServices[index].fe2AName + "   " +  widget.storesServices[index].servicePrice + tr("SAR"):
                              widget.storesServices[index].fe2ANameEn + "   " +  widget.storesServices[index].servicePrice + tr("SAR"),
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
              // Provider.of<HomeProvider>(context, listen: false).searchBarberAPI();
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
                      fontFamily: 'تم',
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
