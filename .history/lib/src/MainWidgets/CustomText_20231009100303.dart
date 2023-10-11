import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText({this.title, this.fontSize, this.fontWeight, this.color});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
