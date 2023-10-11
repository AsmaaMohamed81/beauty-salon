import 'package:beauty_salon/src/provider/auth/authProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:beauty_salon/src/MainWidgets/customMove.dart';
import 'package:beauty_salon/src/MainWidgets/register_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _form = GlobalKey<FormState>();

  bool autoError = false;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
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
                        tr("Forgot your password"),
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
        body: Consumer<AuthProvider>(builder: (context, login, child) {
          return Form(
            key: _form,
            autovalidateMode:
                autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: !isKeyboardShowing
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  CustomMoveList(
                    data: [
                      const SizedBox(height: 25),
                      Visibility(
                        visible: !isKeyboardShowing,
                        child: Container(
                            height: 240,
                            child: Image.asset(
                              "assets/images/mailIllustration.png",
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(height: isKeyboardShowing ? 50 : 40),
                      Text(
                        tr("Enter your email address"),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xff202020),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.408,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        tr("Let's help you change your password"),
                        style: const TextStyle(
                          fontFamily: 'DINNextLTW232',
                          color: Color(0xff202020),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.408,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      RegisterTextField(
                          hint: tr("E-mail"),
                          onChange: (v) {login.email = v;},
                          fillColor: Colors.white,
                          textStyle: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff8a8a8a),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: Color(0xff8a8a8a),
                          ),
                          type: TextInputType.emailAddress),
                      const SizedBox(height: 20),
                      InkWell(
                        // onTap: () {push(ChangePassword());},
                        onTap: () {
                          setState(() => autoError = true);
                          final isValid = _form.currentState.validate();
                          if (!isValid) {
                            return;
                          }
                          _form.currentState.save();
                          login.forgetPassword();
                        },
                        // CustomAlert().toast(title: "تم ارسال كلمه المرور علي بريدك الالكتروني"),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 30, left: 30, bottom: 10),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xffd6246a),
                                    Color(0xff46095c)
                                  ],
                                  stops: [0, 1],
                                  begin: Alignment(-1.00, -0.09),
                                  end: Alignment(1.00, 0.09),
                                  // angle: 95,
                                  // scale: undefined,
                                )),
                            child: Center(
                              child: Text(tr("Save new password"),
                                  style: const TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xffffffff),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
