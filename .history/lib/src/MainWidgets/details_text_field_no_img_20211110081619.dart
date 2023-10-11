import 'package:flutter/material.dart';

class DetailsTextFieldNoImg extends StatefulWidget {
  final String hint;
  final Function onChange;

  const DetailsTextFieldNoImg({Key key, this.hint, this.onChange})
      : super(key: key);

  @override
  _DetailsTextFieldNoImgState createState() => _DetailsTextFieldNoImgState();
}

class _DetailsTextFieldNoImgState extends State<DetailsTextFieldNoImg> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            minLines: 4,
            onChanged: widget.onChange,
            maxLines: 4,
            validator: (value) {
              if (value.isEmpty) {
                return "${widget.hint} مطلوب";
              }
              return null;
            },
            textAlign: TextAlign.right,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(229, 240, 245, 1),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(229, 240, 245, 1)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(229, 240, 245, 1)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(229, 240, 245, 1)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(229, 240, 245, 1)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: widget.hint,
              contentPadding: EdgeInsets.only(top: 20, right: 10),
            ),
          ),
        ));
  }
}
