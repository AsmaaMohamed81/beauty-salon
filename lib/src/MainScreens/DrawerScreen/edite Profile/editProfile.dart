import 'dart:io';
import 'package:beauty_salon/src/Helpers/Widgets/ImagePicker/image_picker_handler.dart';
import 'package:beauty_salon/src/MainWidgets/networkImage.dart';
import 'package:beauty_salon/src/MainWidgets/register_text_field.dart';
import 'package:beauty_salon/src/MainWidgets/route.dart';
import 'package:beauty_salon/src/Repository/networkUtlis.dart';
import 'package:beauty_salon/src/provider/auth/authProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common.dart';
import 'editPassword.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>
    with TickerProviderStateMixin, ImagePickerListener {
  ImageProvider imageProvider = AssetImage("assets/avatar.jpg");

  File _image;

  AnimationController _controller;
  ImagePickerHandler imagePicker;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(
        this, _controller, Color.fromRGBO(12, 169, 149, 1));
    imagePicker.init();
    super.initState();
  }

  final _form = GlobalKey<FormState>();
  bool autoError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
                        tr("Profile personly"),
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
        body: Consumer<AuthProvider>(builder: (context, editProfile, child) {
          return Form(
              key: _form,
              autovalidateMode: autoError
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: ListView(
                shrinkWrap: true,
                // physics: ScrollPhysics(),
                children: <Widget>[
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () => imagePicker.showDialog(context),
                        child: _image == null
                            ? Stack(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff46095C),
                                      borderRadius: BorderRadius.circular(120),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: NetworkUtil
                                                    .userModel.member.mImage ==
                                                null
                                            ? const CustomImageNetwork(
                                                image:
                                                    "https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png")
                                            : CustomImageNetwork(
                                                image:
                                                    AppConfig.MAIN_UserImage_URL +
                                                        NetworkUtil.userModel
                                                            .member.mImage),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 0,
                                    child: Container(
                                      width: 35.0,
                                      height: 35.0,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffd6d7d9),
                                          shape: BoxShape.circle),
                                      child: const Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: Image.file(_image).image,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RegisterTextField(
                    init: "${NetworkUtil.userModel.member.userName}",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xff8a8a8a),
                    ),
                    hint: tr("User Name"),
                    type: TextInputType.text,
                    textStyle: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff8a8a8a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    onChange: (v) => editProfile.editName = v,
                  ),
                  const SizedBox(height: 20),
                  // RegisterTextField(
                  //   init: "${NetworkUtil.userModel.member.userEmail}",
                  //   hint: 'الايميل',
                  //   type: TextInputType.text,
                  //   onChange: (v) => editProfile.editEmail = v,
                  // ),
                  RegisterTextField(
                    hint: tr("phone number"),
                    init: "${NetworkUtil.userModel.member.userPhone}",
                    onChange: (v) => editProfile.phone = v,
                    textStyle: const TextStyle(
                      fontFamily: 'DINNextLTW232',
                      color: Color(0xff8a8a8a),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 30),
                    child: InkWell(
                      onTap: () {
                        setState(() => autoError = true);
                        final isValid = _form.currentState.validate();
                        if (!isValid) {
                          return;
                        }
                        _form.currentState.save();
                        editProfile.editUserData();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xffd6246a), Color(0xff46095c)],
                              stops: [0, 1],
                              begin: Alignment(-1.00, -0.09),
                              end: Alignment(1.00, 0.09),
                              // angle: 95,
                              // scale: undefined,
                            )),
                        child: Center(
                          child: Text(tr("Edit user Profile"),
                              style: const TextStyle(
                                fontFamily: 'DINNextLTW232',
                                color: Color(0xffffffff),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  EditPassword()
                ],
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
