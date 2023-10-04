import 'package:flutter/material.dart';

class Filtter extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color backgroundColor;

  const Filtter({
    Key key,
    this.title,
    this.onTap,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey[200],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right:8.0,left: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
