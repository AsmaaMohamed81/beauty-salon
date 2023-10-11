import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final Function? onTap;
  final Color? color;
  final Color? txtColor;
  final double? heigh;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const CustomBtn(
      {Key? key,
      @required this.text,
      @required this.onTap,
      this.color,
      this.txtColor,
      this.heigh,
      this.padding,
      this.width})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.only(top: 8, right: 30, left: 30, bottom: 8),
      child: MaterialButton(
        onPressed: onTap!(),
        minWidth: width,
        color: color ?? Theme.of(context).primaryColor,
        height: heigh ?? 45,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.white)),
        child: Center(
          child: Text(text!,
              textAlign: TextAlign.center,
              style: TextStyle(color: txtColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
