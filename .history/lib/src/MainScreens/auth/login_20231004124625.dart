import 'package:beauty_salon/src/provider/auth/authProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:beauty_salon/src/MainScreens/auth/signUp.dart';
import 'package:beauty_salon/src/MainScreens/auth/widget/authBody.dart';
import 'package:beauty_salon/src/MainWidgets/customMove.dart';
import 'package:beauty_salon/src/MainWidgets/register_secure_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/register_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:provider/provider.dart';
import 'forgetPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  final _form = GlobalKey<FormState>();

  bool autoError = false;

  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;
    return AuthBody(
      authChild: Consumer<AuthProvider>(builder: (context, login, child) {
      return Form(
            key: _form,
            autovalidateMode:
            autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: !isKeyboardShowing
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
                  children: [
                    CustomMoveList(
                      data: [
                        SizedBox(height: isKeyboardShowing ? 140 : 10),
                        Text(tr("login"),
                            textAlign: TextAlign.center,
                            style:const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff202020),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.528,
                            )
                        ),
                        const SizedBox(height: 20),
                        Visibility(
                          visible: !isKeyboardShowing,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 120,
                                child: Image.asset("assets/images/logo.png")),
                          ),
                        ),

                        const SizedBox(height: 30),
                        RegisterTextField(
                            hint: tr("E-mail"),
                            onChange: (v) {login.email = v;},
                            textStyle: const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff8a8a8a),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.mail,color: Color(0xff8a8a8a),),
                            type: TextInputType.emailAddress),
                        const SizedBox(height: 20),
                        RegisterSecureTextField(
                            onChange: (v) {login.password = v;},
                            fillColor: Colors.white,
                            textStyle: const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff8a8a8a),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            label: tr("password")),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () => push(ForgetPassword()),
                          child:  Padding(
                            padding:const EdgeInsets.only(left: 30,right: 30),
                            child:  Text(tr("Forgot your password"),
                                style:const TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xff46095c),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.36,

                                )
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        InkWell(
                          // onTap: () => push(selectkuafirTypeScreen()),
                          onTap: () {
                            setState(() => autoError = true);
                            final isValid = _form.currentState.validate();
                            if (!isValid) {
                              return;
                            }
                            _form.currentState.save();
                            login.login();
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 30, left: 30, bottom: 10),
                            child: Container(
                              height: 50,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xffd6246a),
                                      Color(0xff46095c) ],
                                    stops: [0, 1],
                                    begin: Alignment(-1.00, -0.09),
                                    end: Alignment(1.00, 0.09),
                                    // angle: 95,
                                    // scale: undefined,
                                  )),
                              child:  Center(
                                child:  Text(tr("login"),
                                    style:const TextStyle(
                                      fontFamily: 'DINNextLTW232',
                                      color: Color(0xffffffff),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    )
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => push(SignUpScreen()),
                              child:  Text(tr("Register a new account"),
                                  style:const TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xff46095c),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.36,

                                  )
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(tr("You don't have an account?"),
                                style:const TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xff3a3a3a),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.36,

                                )
                            )
                          ],
                        )

                      ],
                    )
                  ],
                ),
              ),
            ),
        );
      }

    ));
  }
}
