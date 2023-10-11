import 'package:beauty_salon/src/MainWidgets/customScaffold.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/provider/genral/aboutProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        tr("contact us"),
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
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 25),
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
        onRefresh: () {
          setState(() {});
        },
        service: Provider.of<AboutProvider>(context, listen: false).aboutApp(),
        body: Consumer<AboutProvider>(builder: (context, about, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/images/contactIllustration.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(tr("Our phone numbers"),
                      style: const TextStyle(
                        fontFamily: 'DINNextLTW232',
                        color: Color(0xff202020),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.528,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: InkWell(
                      onTap: () =>
                          launch("tel://" + about.aboutModle!.appInfo!.mobile!),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(color: const Color(0xff707070)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(about.aboutModle!.appInfo!.mobile!,
                                  style: TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xff202020),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(Icons.call_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: InkWell(
                      onTap: () => launch(
                          "tel://" + about.aboutModle!.appInfo!.telepon!),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(color: const Color(0xff707070)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(about.aboutModle!.appInfo!.telepon!,
                                  style: TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xff202020),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                  )),
                              Icon(Icons.call_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(tr("Technical support mail"),
                      style: const TextStyle(
                        fontFamily: 'DINNextLTW232',
                        color: Color(0xff202020),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.528,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          border: Border.all(color: const Color(0xff707070)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(about.aboutModle!.appInfo!.email!,
                                style: TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xff202020),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                            Icon(Icons.email)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
