import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  final Widget? authChild;
  final bool resize;

  const AuthBody({Key? key, this.authChild, this.resize = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resize ?? false,
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/signup.png"),
                fit: BoxFit.cover,
                // colorFilter: new ColorFilter.mode(
                //     Theme.of(context).accentColor.withOpacity(0.2),
                //     BlendMode.dstATop),
              ),
              // gradient: LinearGradient(
              //     colors: [Theme.of(context).primaryColor, Colors.black],
              //     begin: Alignment.bottomCenter,
              //     end: Alignment.topCenter),
            ),
            child: authChild),
      ),
    );
  }
}
