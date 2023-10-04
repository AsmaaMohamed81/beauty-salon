import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common.dart';

// ignore: must_be_immutable
class AppBottomBar extends StatefulWidget {
  final Function? onTap;
  int? inx;

  AppBottomBar({Key? key, this.onTap, this.inx}) : super(key: key);
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(0), topLeft: Radius.circular(0)),
      child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
            fontFamily: 'DINNextLTW232',
            color: Color(0xff46095c),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.312,
          ),
          unselectedLabelStyle: TextStyle(
            fontFamily: 'DINNextLTW232',
            color: Color(0xff999999),
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.312,
          ),
          unselectedIconTheme: IconThemeData(color: Color(0xff999999)),
          unselectedItemColor: Color(0xff999999),
          selectedItemColor: Color(0xff46095c),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: widget.inx,
          elevation: 100,
          onTap: (index) {
            // if (index == 4) {
            //   Scaffold.of(context).openEndDrawer();
            //   return;
            // }
            setState(() => widget.inx = index);
            widget.onTap!(index);
          },
          items: [
            BottomNavigationBarItem(
              label: tr("Home"),
              icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/icon/Glyph.svg",
                      color: disActiveColor)),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/icon/Glyph.svg",
                    color: activeColor),
              ),
            ),
            BottomNavigationBarItem(
              label: tr("Notifications"),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/icon/not.svg",
                    color: disActiveColor),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icon/not.svg",
                  color: activeColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(null),
              ),
            ),
            BottomNavigationBarItem(
              // label: tr("Messeges"),
              label: tr("Orders"),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/icon/Messeges.svg",
                    color: disActiveColor),
                // child: Icon(Icons.article_outlined,color: disActiveColor,)
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icon/Messeges.svg",
                  color: activeColor,
                ),
                // child: Icon(Icons.article_outlined,color: activeColor,)
              ),
            ),
            BottomNavigationBarItem(
              label: tr("Offers"),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/icon/Offers.svg",
                    color: disActiveColor),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/icon/Offers.svg",
                  color: activeColor,
                ),
              ),
            ),
          ]),
    );
  }
}
