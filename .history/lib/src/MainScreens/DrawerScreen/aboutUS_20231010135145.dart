import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/genral/aboutProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(105.0),
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/Rectangle 3703.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                  child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      tr("who are we"),
                      style: const TextStyle(
                        fontFamily: 'DINNextLTW232',
                        color: Color(0xffffffff),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.528,
                      ),
                      textAlign: TextAlign.center,
                    )),
              )),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: () {
                    pop();
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 25),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assets/images/Group 703.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              )),
            ],
          )),
      service: Provider.of<AboutProvider>(context, listen: false).aboutApp(),
      body: Consumer<AboutProvider>(builder: (context, about, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(
                  data: '${about.aboutModle!.appInfo!.aboutApp!}',
                  //  defaultTextStyle: TextStyle(
                  //     fontWeight: FontWeight.w400,
                  //     fontSize: 17,
                  //     fontFamily: 'DINNextLTW232',
                  //     color: Color(0xff202020),
                  //   ),
                  //   customTextAlign: (c) => TextAlign.right,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
