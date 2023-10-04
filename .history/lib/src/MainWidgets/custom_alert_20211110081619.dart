import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'customBtn.dart';

class CustomAlert {
  showOptionDialog(
      {String msg,
      String btnMsg,
      Function onClick,
      BuildContext context,
      String cancel,
      Function onCancel}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            elevation: 5,
            contentPadding: EdgeInsets.only(top: 10, left: 5, right: 5),
            children: <Widget>[
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomBtn(
                    color: Colors.red,
                    onTap: onCancel,
                    text: cancel,
                    txtColor: Colors.white,
                  ),
                  SizedBox(width: 10),
                  CustomBtn(
                    color: Theme.of(context).primaryColor,
                    onTap: onClick,
                    text: btnMsg,
                    txtColor: Colors.white,
                  ),
                ],
              ),
            ],
          );
        });
  }

  showCustomDialog(
      {String msg, String btnMsg, Function onClick, BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor: Colors.white,
            elevation: 5,
            contentPadding: EdgeInsets.only(top: 10, left: 10, right: 10),
            children: <Widget>[
              Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: CustomBtn(
                    color: Theme.of(context).primaryColor,
                    onTap: onClick,
                    text: btnMsg,
                    txtColor: Colors.white),
              ),
            ],
          );
        });
  }

  toast({ String title}) {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
