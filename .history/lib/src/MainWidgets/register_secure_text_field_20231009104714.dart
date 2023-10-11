import 'package:flutter/material.dart';

class RegisterSecureTextField extends StatefulWidget {
  final String? label;
  final Function? onChange;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderSideColor;

  const RegisterSecureTextField({
    this.label,
    this.onChange,
    this.hintStyle,
    this.textStyle,
    this.fillColor,
    this.borderSideColor,
  });

  @override
  _RegisterSecureTextFieldState createState() =>
      _RegisterSecureTextFieldState();
}

class _RegisterSecureTextFieldState extends State<RegisterSecureTextField> {
  bool see = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          style: widget.textStyle ??
              TextStyle(color: Color.fromRGBO(229, 240, 245, 1)),
          textAlign: TextAlign.right,
          onChanged: widget.onChange!(),
          obscureText: see,
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.label} مطلوب";
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline),
            hintText: widget.label,
            suffixIcon: IconButton(
              icon: Icon(
                see ? Icons.visibility_off : Icons.visibility,
                color: Color(0xff8a8a8a),
              ),
              onPressed: () => setState(() => see = !see),
            ),
            contentPadding: EdgeInsets.only(top: 14, right: 10),
            filled: true,
            fillColor: widget.fillColor,
            hintStyle: widget.hintStyle ?? TextStyle(color: Color(0xff8a8a8a)),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderSideColor ?? Color(0xff8a8a8a)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderSideColor ?? Color(0xff8a8a8a)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderSideColor ?? Color(0xff8a8a8a)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderSideColor ?? Color(0xff8a8a8a)),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
