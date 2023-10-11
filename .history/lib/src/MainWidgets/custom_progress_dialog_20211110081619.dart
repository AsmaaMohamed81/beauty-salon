import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../main.dart';

class CustomProgressDialog {
  ProgressDialog pr;

  void showProgressDialog() {
    pr = ProgressDialog(navigator.currentContext,
        isDismissible: false, type: ProgressDialogType.Normal);
    pr.style(message: 'Showing some progress...');
    pr.style(
      message: '              يرجى الانتظار',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SpinKitThreeBounce(
          color: Theme.of(navigator.currentContext).primaryColor,
          size: 25,
        ),
      ),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progressTextStyle: TextStyle(
          color: Theme.of(navigator.currentContext).primaryColor,
          fontSize: 8.0,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Theme.of(navigator.currentContext).primaryColor,
          fontSize: 15.0,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w600),
    );
    pr.show();
  }

  hidePr() {
    pr = ProgressDialog(navigator.currentContext);
    pr.hide();
  }
}
