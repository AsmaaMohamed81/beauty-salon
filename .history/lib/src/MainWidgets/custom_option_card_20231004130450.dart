import 'dart:js';

import 'package:flutter/material.dart';

import '../app.dart';

class CustomOptionCard {
  Widget optionCard({String? label, String? icon, Function? onTap}) {
    return InkWell(
      onTap: onTap!(),
      child: Padding(
        padding: EdgeInsets.only(top: 3, right: 10, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 10,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    label!,
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black87, fontSize: 17),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: ImageIcon(
                    AssetImage(icon!),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget optionCard2(
      {String? txt, IconData? icon, Function? onTap, Color? color}) {
    return Directionality(
      textDirection: context.locale.languageCode.toString() == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 47,
            child: ListTile(
              leading: Icon(icon),
              title: Text(
                txt,
                style: TextStyle(
                    color: color == null ? Colors.black : color, fontSize: 17),
              ),
              trailing: Directionality(
                textDirection: appContext.locale.languageCode.toString() == "en"
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: color == null ? Colors.grey : color,
                  size: 20,
                ),
              ),
              onTap: onTap,
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
