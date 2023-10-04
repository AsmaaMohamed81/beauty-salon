import 'package:flutter/material.dart';

class SimpleTextField extends StatefulWidget {
  final TextInputType? type;
  final String? hint;
  final Function? onChange;
  final String? init;
  final double? padding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Icon? prefixIcon;
  final Color? fillColor;
  final Color? borderSideColor;

  const SimpleTextField({
    this.type,
    this.hint,
    this.onChange,
    this.init,
    this.padding,
    this.hintStyle,
    this.textStyle,
    this.prefixIcon,
    this.fillColor,
    this.borderSideColor,
  });

  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            right: widget.padding ?? 30, left: widget.padding ?? 30),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            style: widget.textStyle ??
                TextStyle(color: Color.fromRGBO(229, 240, 245, 1)),
            initialValue: widget.init,
            textAlign: TextAlign.right,
            keyboardType:
                widget.hint == 'phone' ? TextInputType.phone : widget.type,
            onFieldSubmitted: (v) {},
            onChanged: widget.onChange!(),
            validator: (value) {
              if (value!.isEmpty) {
                return "${widget.hint} مطلوب";
              }
              return null;
            },
            decoration: InputDecoration(
              // prefixIcon: widget.prefixIcon ?? const SizedBox(),
              filled: true,
              fillColor: widget.fillColor,
              hintStyle: widget.hintStyle ??
                  TextStyle(
                    color: Color(0xff8a8a8a),
                  ),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderSideColor ?? Color(0xff707070)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderSideColor ?? Color(0xff707070)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderSideColor ?? Color(0xff707070)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: widget.borderSideColor ?? Color(0xff707070)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.hint,
              contentPadding: EdgeInsets.only(top: 0, right: 10),
            ),
          ),
        ));
  }
}
