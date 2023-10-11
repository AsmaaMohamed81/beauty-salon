import 'dart:io';

import 'package:beauty_salon/src/Helpers/Widgets/ImagePicker/image_picker_handler.dart';
import 'package:beauty_salon/src/MainWidgets/customMove.dart';
import 'package:beauty_salon/src/provider/auth/authProvider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:beauty_salon/src/MainScreens/auth/login.dart';
import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/register_secure_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/register_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:provider/provider.dart';
import 'widget/authBody.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin, ImagePickerListener {
  ImageProvider imageProvider = const AssetImage("assets/avatar.jpg");

  File? _image;

  AnimationController? _controller;
  ImagePickerHandler? imagePicker;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = ImagePickerHandler(
        this, _controller!, const Color.fromRGBO(12, 169, 149, 1));
    imagePicker!.init();
    super.initState();
  }

  final _form = GlobalKey<FormState>();
  bool autoError = false;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardShowing = MediaQuery.of(context).viewInsets.vertical > 0;
    return AuthBody(
        resize: true,
        authChild: Consumer<AuthProvider>(builder: (context, login, child) {
          return Form(
              key: _form,
              autovalidateMode: autoError
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsets.only(top: isKeyboardShowing ? 40 : 180),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: !isKeyboardShowing
                    //     ? MainAxisAlignment.center
                    //     : MainAxisAlignment.start,
                    children: [
                      CustomMoveList(data: [
                        Text(
                          tr("Register a new account"),
                          style: const TextStyle(
                            fontFamily: 'DINNextLTW232Bold',
                            color: Color(0xff202020),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.528,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),

                        Visibility(
                          // visible: !isKeyboardShowing,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 110,
                                child: Image.asset("assets/images/logo.png")),
                          ),
                        ),
                        // SizedBox(height: isKeyboardShowing ? 140 : 10),
                        RegisterTextField(
                            hint: tr("name"),
                            onChange: (v) {
                              login.name = v;
                            },
                            textStyle: const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff8a8a8a),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            fillColor: Colors.white,
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xff8a8a8a),
                            ),
                            type: TextInputType.text),
                        const SizedBox(height: 20),
                        RegisterTextField(
                            hint: tr("phone number"),
                            onChange: (v) {
                              login.phone = v;
                            },
                            fillColor: Colors.white,
                            textStyle: const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xff8a8a8a),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_in_talk,
                              color: Color(0xff8a8a8a),
                            ),
                            type: TextInputType.phone),
                        const SizedBox(height: 20),
                        RegisterTextField(
                            hint: tr("E-mail"),
                            onChange: (v) {
                              login.email = v;
                            },
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
                        RegisterSecureTextField(
                          onChange: (v) {
                            login.password = v;
                          },
                          label: tr("password"),
                          fillColor: Colors.white,
                          textStyle: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff8a8a8a),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        RegisterSecureTextField(
                          onChange: (v) {
                            login.passwordConfirmation = v;
                          },
                          label: tr("password confirmation"),
                          fillColor: Colors.white,
                          textStyle: const TextStyle(
                            fontFamily: 'DINNextLTW232',
                            color: Color(0xff8a8a8a),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, left: 30, right: 30),
                          child: Row(
                            children: [
                              DottedBorder(
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(20),
                                  dashPattern: const [10, 10],
                                  color: const Color(0xff46095c),
                                  strokeWidth: 2,
                                  child: InkWell(
                                    onTap: () =>
                                        imagePicker!.showDialog(context),
                                    child: _image == null
                                        ? Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SizedBox(
                                              height: 130,
                                              width: 170,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "+",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'DINNextLTW232',
                                                      color: Color(0xff46095c),
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: 0.528,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  Text(
                                                    tr("Add a profile picture"),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'DINNextLTW232',
                                                      color: Color(0xff46095c),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      letterSpacing: 0.528,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 60,
                                            backgroundImage:
                                                Image.file(_image!).image,
                                          ),
                                  ))
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                        InkWell(
                          // onTap: () => push(selectkuafirTypeScreen()),
                          onTap: () {
                            if (login.password != login.passwordConfirmation) {
                              CustomAlert()
                                  .toast(title: tr("Password does not match"));
                              return;
                            }
                            setState(() => autoError = true);
                            final isValid = _form.currentState!.validate();
                            if (!isValid) {
                              return;
                            }
                            _form.currentState!.save();
                            login.singUp();
                          },
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
                                child: Text(tr("Create an account"),
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
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => push(LoginScreen()),
                              child: Text(tr("login"),
                                  style: const TextStyle(
                                    fontFamily: 'DINNextLTW232',
                                    color: Color(0xff46095c),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.36,
                                  )),
                            ),
                            const SizedBox(width: 20),
                            Text(tr("Already have an account?"),
                                style: const TextStyle(
                                  fontFamily: 'DINNextLTW232',
                                  color: Color(0xff3a3a3a),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.36,
                                ))
                          ],
                        ),
                        const SizedBox(height: 50),
                      ])
                    ],
                  ),
                ),
              ));
        }));
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
      Provider.of<AuthProvider>(context, listen: false).image = _image;
    });
  }
}
