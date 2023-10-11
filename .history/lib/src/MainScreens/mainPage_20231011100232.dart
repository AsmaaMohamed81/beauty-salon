import 'package:beauty_salon/src/MainScreens/ChatRoom/ChatRoomScreen.dart';
import 'package:beauty_salon/src/MainWidgets/app_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Home/homeScreen.dart';
import 'Offers/OffersScreen.dart';
import 'DrawerScreen/drawerWidget.dart';
import 'barber request Screen/BarberRequestScreen.dart';
import 'notifaction/notifactionScreen.dart';

class MainPage extends StatefulWidget {
  final int? index;
  MainPage({this.index});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0;

  List<Widget> widgets = [
    HomeScreen(),
    NotifactionScreen(),
    // CreateNewOrderScreen(fromMain: true,),
    BarberRequestScreen(),
    ChatRoomScreen(),
    OffersScreen(),
  ];

  void selectedpage() {
    setState(() => _bottomNavIndex = widget.index!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      endDrawer: Drawer(child: DrawerScreen()),
      body: widgets[_bottomNavIndex],
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: InkWell(
            onTap: () => setState(() => _bottomNavIndex = 2),
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffd6246a), Color(0xff46095c)],
                    stops: [0, 1],
                    begin: Alignment(-0.75, -0.66),
                    end: Alignment(0.75, 0.66),
                  ),
                  shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25,
                    width: 40,
                    child: SvgPicture.asset("assets/icon/Mask00.svg"),
                  ),
                  Text(
                    tr("Request Barber"),
                    style: const TextStyle(
                        fontFamily: 'DINNextLTW232',
                        color: Color(0xffffffff),
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.312),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomBar(
        onTap: (v) => setState(() => _bottomNavIndex = v),
        inx: _bottomNavIndex,
      ),
    );
  }
}
