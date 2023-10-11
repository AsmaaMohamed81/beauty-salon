import 'package:beauty_salon/src/modle/Booking/GetUserOrdersModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyOrdersCard extends StatefulWidget {
  final Order? order;

  const MyOrdersCard({
    Key? key,
    this.order,
  }) : super(key: key);
  @override
  State<MyOrdersCard> createState() => _MyOrdersCardState();
}

class _MyOrdersCardState extends State<MyOrdersCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: InkWell(
          onTap: () {
            _onAlertWithCustomContentPressed(context);
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(tr("order number"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xff707070),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.36,
                              )),
                          Text(widget.order!.orderId!,
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
                      Row(
                        children: [
                          Text(tr("Order status"),
                              style: const TextStyle(
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
                                color: Color(0xff46095c), //green
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.36,
                              ))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(tr("Required service"),
                          style: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.36,
                          )),
                      Column(
                        children: widget.order.details.map((date) {
                          int index = widget.order.details
                              .indexOf(date); // use index if you want.
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
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(tr("Date of visit"),
                          style: const TextStyle(
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
                    children: [
                      Text(tr("Time of visit"),
                          style: const TextStyle(
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
                ]),
              )),
        ));
  }

  _onAlertWithCustomContentPressed(context) {
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
      title: tr("Details of the order"),
      content: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(tr("Order status"),
                  style: const TextStyle(
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
                    color: Color(0xff46095c), //green
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
            children: [
              Text(tr("order number"),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Text(widget.order.orderId,
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
            children: [
              Text(tr("Required service"),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Column(
                children: widget.order.details.map((date) {
                  int index = widget.order.details
                      .indexOf(date); // use index if you want.
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
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(tr("Date of visit"),
                  style: const TextStyle(
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
            children: [
              Text(tr("Time of visit"),
                  style: const TextStyle(
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
            height: 7,
          ),
          Row(
            children: [
              Text(tr("barber's name"),
                  style: const TextStyle(
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
            children: [
              Text(tr("Home Address"),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
            ],
          ),
          Text(
            widget.order.customerAddress,
            style: TextStyle(
              fontFamily: 'DINNextLTW232',
              color: Color(0xff3a3a3a),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.36,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Text(tr("Visiting Fee"),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Text(widget.order.allSum + tr("SAR"),
                  style: const TextStyle(
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
            children: [
              Text(tr("Number People"),
                  style: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.36,
                  )),
              Text(widget.order.details[0].quantity,
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
          // const SizedBox(
          //   height: 7,
          // ),
          // Row(
          //   children:  [
          //      Text(tr("Bank account information"),
          //         style:const TextStyle(
          //           fontFamily: 'DINNextLTW232',
          //           color: Color(0xff202020),
          //           fontSize: 20,
          //           fontWeight: FontWeight.w500,
          //           fontStyle: FontStyle.normal,
          //           letterSpacing: 0.528,
          //         )
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 7,
          // ),
          //  Container(
          //     decoration:  BoxDecoration(
          //       border: Border.all(color: const Color(0xff707070),width: 1),
          //         color:const Color(0xffffffff),
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //    child:const Padding(
          //      padding: EdgeInsets.all(8.0),
          //      child: Text("This text is an example of a text that can be replaced in the same \n space. This text was generated from the Arabic \n text generator, where you can generate such text or many \n other texts in addition to increasing the number of characters it\n generates. Application",
          //        style: TextStyle(
          //          fontFamily: 'DINNextLTW232',
          //          color: Color(0xff3a3a3a),
          //          fontSize: 13,
          //          fontWeight: FontWeight.w400,
          //          fontStyle: FontStyle.normal,
          //        ),
          //      ),
          //    ),
          //
          // )
        ],
      ),
    ).show();
  }
}
