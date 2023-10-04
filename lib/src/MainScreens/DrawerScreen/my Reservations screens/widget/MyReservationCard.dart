import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/modle/Booking/GetUserOrdersModel.dart';
import 'package:beauty_salon/src/provider/Reservations/ReservationsProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyReservationCard extends StatefulWidget {
  final Order order;

  const MyReservationCard({Key key,this.order,}) : super(key: key);
  @override
  State<MyReservationCard> createState() => _MyReservationCardState();
}

class _MyReservationCardState extends State<MyReservationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: InkWell(
          onTap: () {
            _AlertOfReservationDetails(context, widget.order);
          },
          child: Container(
              width: 327,
              // height: 108,
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
                padding: const EdgeInsets.all(12),
                child: Column(children: [
                  Row(
                    children:  [
                      Text(tr("Reservation number"),
                          style:const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                       Text(tr(widget.order.orderId),
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff46095c),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children:  [
                      Text(tr("Reservation status"),
                          style:const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                       Text(tr(widget.order.status),
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Colors.green, //Color(0xff46095c)
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children:  [
                      Text(tr("Shop Name"),
                          style:const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                       Text(widget.order.storeName,
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff46095c),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children:  [
                      Text(tr("booking date"),
                          style:const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                       Text(widget.order.orderDate,
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff46095c),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children:  [
                      Text(tr("booking Time"),
                          style:const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                       Text(widget.order.orderTime,
                          style: TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff3a3a3a),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.order.status == "cancelled" ? Container():
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Provider.of<ReservationsProvider>(context, listen: false).cancelOrderAPI(widget.order.orderId);
                        },
                        child: Container(
                            width: 192,
                            height: 40,
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient:const LinearGradient(
                                  colors: [
                                    Color(0xffd6246a),
                                    Color(0xff46095c) ],
                                  stops: [0, 1],
                                  begin: Alignment(-0.99, -0.16),
                                  end: Alignment(0.99, 0.16),
                                )
                            ),
                          child: Center(
                            child: Text(tr("Cancel Reservation"),
                                style:const TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xffffffff),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ]),
              )),
        ));
  }

  _AlertOfReservationDetails(context ,Order order) {
    Alert(
      context: context,
      closeIcon: Padding(
        padding: const EdgeInsets.only(left: 15, top: 0, right: 15),
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
      title: tr("Reservation Details"),
      content: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
            children:  [
              Text(tr("Reservation status"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
               Text(tr(widget.order.status),
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Colors.green, //Color(0xff46095c)
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  ))
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Text(tr("Reservation number"),
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Text(order.orderId,
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff46095c),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Spacer()
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Text(tr("Shop Name"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
               Text(order.storeName,
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff3a3a3a),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Text(tr("booking date"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
               Text(order.orderDate,
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff3a3a3a),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Text(tr("booking Time"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
               Text(order.orderTime,
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff3a3a3a),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  ))
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Text(tr("Number of people"),
                  style:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
               Text(order.details[0].quantity,
                  style: TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff3a3a3a),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  ))
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children:  [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(tr("Required service"),
                    style:const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff707070),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.36,
                    )),
              ),
              Column(
                children: order.details.map((date) {
                  int index = order.details.indexOf(date); // use index if you want.
                  print(index);
                  return Text(date.fe2AName,
                      style: TextStyle(
                        fontFamily: 'DINNextLTW232',
                        color: Color(0xff3a3a3a),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.36,
                      ));
                }).toList(),
              ),

            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
          //       children:  [
          //         Padding(
          //           padding: const EdgeInsets.all(3.0),
          //           child: Text(tr("Required service"),
          //               style:const TextStyle(
          //                 fontFamily: 'DINNextLTW232',
          //                 color: Color(0xff707070),
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.w400,
          //                 fontStyle: FontStyle.normal,
          //                 letterSpacing: 0.36,
          //               )),
          //         ),
          //         Column(
          //           children: order.details.map((date) {
          //             int index = order.details.indexOf(date); // use index if you want.
          //             print(index);
          //             return Text(date.fe2AName,
          //                 style: TextStyle(
          //                   fontFamily: 'DINNextLTW232',
          //                   color: Color(0xff3a3a3a),
          //                   fontSize: 15,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   letterSpacing: 0.36,
          //                 ));
          //           }).toList(),
          //         ),
          //
          //       ],
          //     ),
          //     Column(
          //       children:  [
          //         Text(tr("Number of people"),
          //             style:const TextStyle(
          //               fontFamily: 'DINNextLTW232',
          //               color: Color(0xff707070),
          //               fontSize: 15,
          //               fontWeight: FontWeight.w400,
          //               fontStyle: FontStyle.normal,
          //               letterSpacing: 0.36,
          //             )),
          //         Column(
          //           children: order.details.map((date) {
          //             int index = order.details.indexOf(date); // use index if you want.
          //             print(index);
          //             return Padding(
          //               padding: const EdgeInsets.all(3.0),
          //               child: Text(date.quantity,
          //                   style: TextStyle(
          //                     fontFamily: 'DINNextLTW232',
          //                     color: Color(0xff3a3a3a),
          //                     fontSize: 15,
          //                     fontWeight: FontWeight.w500,
          //                     fontStyle: FontStyle.normal,
          //                     letterSpacing: 0.36,
          //                   )),
          //             );
          //           }).toList(),
          //         ),
          //
          //       ],
          //     ),
          // ],),
          const SizedBox(
            height: 7,
          ),
          const SizedBox(
            height: 11,
          ),
          widget.order.status == "cancelled" ? Container():
          InkWell(
             onTap: (){
               pop();
               Provider.of<ReservationsProvider>(context, listen: false).cancelOrderAPI(order.orderId);
             },
             child: Container(
                width: 280,
                height: 38,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient:const LinearGradient(
                      colors: [
                        Color(0xffd6246a),
                        Color(0xff46095c) ],
                      stops: [0, 1],
                      begin: Alignment(-1.00, -0.07),
                      end: Alignment(1.00, 0.07),
                    ),
                ),
               child: Center(
                 child:  Text(tr("Cancel Reservation"),
                     style:const TextStyle(
                       fontFamily: 'DINNextLTW232',
                       color: Color(0xffffffff),
                       fontSize: 15,
                       fontWeight: FontWeight.w500,
                       fontStyle: FontStyle.normal,


                     )
                 ),
               ),
          ),
           )
        ],
      ),
    ).show();
  }
}
