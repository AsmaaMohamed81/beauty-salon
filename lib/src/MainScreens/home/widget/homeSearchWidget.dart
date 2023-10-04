import 'package:beauty_salon/src/provider/Home/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeSearchWidget extends StatefulWidget {
  @override
  _HomeSearchWidgetState createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.right,
            keyboardType: TextInputType.text,
            onChanged: (v) {
              Provider.of<HomeProvider>(context, listen: false).searchWord = v;
              Provider.of<HomeProvider>(context, listen: false).searchBarberAPI();
              },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF2F2F2),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset("assets/icon/search.svg"),
              ),
              suffixIconConstraints:
                  BoxConstraints(maxWidth: 40, maxHeight: 20),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(229, 240, 245, 1)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "Looking for a barber",
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(top: 0, right: 10),
            ),
          ),
        ),
      ],
    );
  }

}
