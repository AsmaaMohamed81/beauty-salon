import 'dart:async';
import 'package:flutter/material.dart';
import 'MainScreens/auth/login.dart';
import 'MainScreens/auth/selectkuafirTypeScreen.dart';
import 'Repository/networkUtlis.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:page_transition/page_transition.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animation.addListener(() {
      setState(() {});
    });
    _animation.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        navigationPage();
      }
    });

    _animationController.forward();
  }

  Future navigationPage() async {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) =>
    //     NetworkUtil.userModel.data[0].accessToken != null ? MainPage(index: 0):LoginScreen()));
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.scale,
      splash: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
      ),
      nextScreen: NetworkUtil.userModel.member!.userId == null
          ? LoginScreen()
          : selectkuafirTypeScreen(),
    ));
  }
}
