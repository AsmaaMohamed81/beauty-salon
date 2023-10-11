import 'package:beauty_salon/src/MainScreens/Single%20Salon%20Screens/appointment%20Booking%20screen/widget/ShowServicesDialog.dart';
import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/simple_text_field.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/modle/Home/AllBarbersModel.dart';
import 'package:beauty_salon/src/provider/Booking/BookingProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarberRequestScreen extends StatefulWidget {
  @override
  _BarberRequestScreenState createState() => _BarberRequestScreenState();
}

class _BarberRequestScreenState extends State<BarberRequestScreen> {
  @override
  void initState() {
    // Provider.of<BookingProvider>(context, listen: false).allBarbersAPI();
    super.initState();
  }

  final note = TextEditingController();
  final discountCode = TextEditingController();
  final userPhone = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  bool _accept = false;

  final _form = GlobalKey<FormState>();
  bool autoError = false;

  var selectedTimeVall = tr("time to visit");
  var selectedDateVall = tr("Date of visit2");

  // String selectedValue;
  Store? selectedValue;

  @override
  Widget build(BuildContext context) {
    Provider.of<BookingProvider>(context, listen: false).total = "0";
    print("jhgfdfghjk" + NetworkUtil.KuafirTypeSelected!);
    return Scaffold(
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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        tr("Create a new request"),
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
                ))
              ],
            )),
        body: Consumer<BookingProvider>(builder: (context, snapshot, child) {
          return Form(
            key: _form,
            autovalidateMode:
                autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 20),
                    child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10)),
                        child:
//TODO  DropdownButtonFormField ##########################
                            Theme(
                          data: Theme.of(context).copyWith(
                              // canvasColor: primaryColor,
                              ),
                          child: Container(
                            height: 55,
                            // width: MediaQuery.of(context).size.width/1.1,
                            child: DropdownButtonFormField<Store>(
                              decoration: InputDecoration(
                                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                // filled: true,
                                // fillColor: Color.fromRGBO(229, 240, 245, 1),
                                contentPadding:
                                    EdgeInsets.only(left: 10, right: 10),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              value: selectedValue,
                              hint: Text(
                                tr("Choose a salon"),
                                style: TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xff3a3a3a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              items: snapshot.allBarbersModel!.stores!
                                  .map((label) => DropdownMenuItem(
                                        child: Container(
                                            child: Text(label.storeName!,
                                                style: TextStyle(
                                                  fontFamily: 'DINNextLTW232',
                                                  color: Color(0xff3a3a3a),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                ))),
                                        value: label,
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                selectedValue = value;
                                // setState(() => selectedID = value);
                              },
                            ),
                          ),
                        )
                        //TODO   ##########################
                        ),
                  ),
                  SimpleTextField(
                    fillColor: Colors.white,
                    hint: tr("Barber's name"),
                    type: TextInputType.text,
                    textStyle: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff8a8a8a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    onChange: (v) => snapshot.BarbersName = v,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 44,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xff707070), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: InkWell(
                              onTap: () {
                                _selectTime(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedTimeVall,
                                      style: TextStyle(
                                        fontFamily: 'DINNextLTW232',
                                        color: Color(0xff8a8a8a),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  Icon(
                                    Icons.access_time,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 44,
                          decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: const Color(0xff707070), width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: InkWell(
                              onTap: () {
                                _selectDate(context);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(selectedDateVall,
                                      style: const TextStyle(
                                        fontFamily: 'DINNextLTW232',
                                        color: Color(0xff8a8a8a),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  const Icon(
                                    Icons.date_range,
                                    color: Color(0xff707070),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SimpleTextField(
                    fillColor: Colors.white,
                    hint: tr("Home Address2"),
                    type: TextInputType.text,
                    textStyle: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff8a8a8a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    onChange: (v) => snapshot.homeAddressVall = v,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SimpleTextField(
                    fillColor: Colors.white,
                    hint: NetworkUtil.userModel!.member == null
                        ? tr("phone number")
                        : NetworkUtil.userModel!.member!.userPhone,
                    type: TextInputType.number,
                    textStyle: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff8a8a8a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    onChange: (v) => snapshot.Phone = v,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 44,
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black45),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10)),
                          child: SimpleTextField(
                              padding: 0,
                              fillColor: Colors.white,
                              // hint: tr("The number of people"),
                              hint: tr("The number of people"),
                              type: TextInputType.number,
                              textStyle: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xff8a8a8a),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              onChange: (v) {
                                snapshot.NumberOfPeople = v;
                                Provider.of<BookingProvider>(context,
                                        listen: false)
                                    .calculatTotalServicePrice();
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            selectedValue == null
                                ? CustomAlert()
                                    .toast(title: tr("Salon must be chosen"))
                                : showDialog(
                                    context: context,
                                    builder: (_) {
                                      return ShowServicesDialog(
                                          storesServices:
                                              selectedValue!.storesServices!);
                                    });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 44,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black45),
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tr("Service"),
                                      style: const TextStyle(
                                        fontFamily: 'DINNextLTW232',
                                        color: Color(0xff8a8a8a),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                      )),
                                  const Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 0, bottom: 0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xff707070)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        minLines: null,
                        // maxLines: 7,
                        style: const TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xff8a8a8a),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: tr("discount code"),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        controller: discountCode,
                        // onChange: (v) => editProfile.editName = v,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 15, bottom: 15),
                    child: Container(
                      height: 74,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xff707070)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        minLines: null,
                        maxLines: 7,
                        style: const TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xff8a8a8a),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: tr("Notes"),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        controller: note,
                        // onChange: (v) => editProfile.editName = v,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10,right: 10),
                  //   child: Theme(
                  //     data: ThemeData(
                  //         unselectedWidgetColor: Color(0xff46095C)),
                  //     child: CheckboxListTile(
                  //         value: _accept,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             _accept = !_accept;
                  //           });
                  //         },
                  //         activeColor:const Color(0xff46095C),
                  //         checkColor: Colors.white,
                  //         dense: true,
                  //         title: const Text("يتم إخلاء مسؤولية المحل من أي  ......",
                  //             style: TextStyle(
                  //               fontFamily: 'DINNextLTW232',
                  //               color: Color(0xff3a3a3a),
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.w400,
                  //               fontStyle: FontStyle.normal,
                  //             )
                  //         )
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 25, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(tr("total fee"),
                            style: const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff3a3a3a),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Text(snapshot.total,
                            style: TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff202020),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.528,
                            ))
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 0, bottom: 100),
                    child: InkWell(
                      onTap: () {
                        Provider.of<BookingProvider>(context, listen: false)
                            .Notes = note.text;
                        Provider.of<BookingProvider>(context, listen: false)
                            .discountCode = discountCode.text;
                        setState(() => autoError = true);
                        final isValid = _form.currentState!.validate();
                        if (!isValid) {
                          return;
                        }
                        _form.currentState!.save();
                        // if(!_accept){
                        //   CustomAlert().toast(title:tr("يجب الموافقة علي الشروط والاحكام"));
                        //   return;
                        // }
                        if (snapshot.selectedTimeVall == null) {
                          CustomAlert().toast(
                              title: tr(
                                  "The time of the visit must be determined"));
                          return;
                        }
                        if (snapshot.selectedDateVall == null) {
                          CustomAlert().toast(
                              title: tr(tr(
                                  "The date of the visit must be specified")));
                          return;
                        }
                        if (snapshot.serviceSelected.length == 0) {
                          CustomAlert()
                              .toast(title: tr("Service must be selected"));
                          return;
                        }
                        snapshot.addOrderToHomeApi(selectedValue!.storeId!);
                      },
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xffd6246a), Color(0xff46095c)],
                              stops: [0, 1],
                              begin: Alignment(-1.00, -0.09),
                              end: Alignment(1.00, 0.09),
                            )),
                        child: Center(
                          child: Text(tr("Reservation"),
                              // child:  Text(tr("Pay the visit fee"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xffffffff),
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          );
        });

    if (picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s!;
        selectedTimeVall =
            "${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}";
        Provider.of<BookingProvider>(context, listen: false).selectedTimeVall =
            selectedTimeVall;
      });
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate:
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
      lastDate: DateTime(2099),
    );
    if (selected != selectedDate)
      setState(() {
        selectedDate = selected!;
        selectedDateVall =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        Provider.of<BookingProvider>(context, listen: false).selectedDateVall =
            selectedDateVall;
      });
  }
}
