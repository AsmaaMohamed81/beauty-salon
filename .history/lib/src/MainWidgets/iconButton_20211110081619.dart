import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final double size;
  final IconData icon;
  final Function onTap;
  final Color iconColor;

  const CustomIconButton(
      {Key key,
      @required this.icon,
      this.size,
      this.onTap,
      this.color,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 25,
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color ?? Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.all(5)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(size != null ? size / 2 : 12.5),
              ),
            )),
        // height: size ?? 25,
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor ?? Colors.black54,
          ),
        ),
        onPressed: onTap ?? () {},
      ),
    );
  }
}
