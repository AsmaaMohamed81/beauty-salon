import 'package:beauty_salon/src/MainWidgets/custom_alert.dart';
import 'package:beauty_salon/src/MainWidgets/register_secure_text_field.dart';
import 'package:beauty_salon/src/provider/auth/authProvider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatefulWidget {
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _form = GlobalKey<FormState>();
  bool autoError = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, editPass, child) {
      return Stack(
        children: <Widget>[
          Form(
            key: _form,
            autovalidateMode:
                autoError ? AutovalidateMode.always : AutovalidateMode.disabled,
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: <Widget>[
                RegisterSecureTextField(
                  label: tr("password"),
                  textStyle: const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff8a8a8a),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  onChange: (v) => editPass.oldPassword = v,
                ),
                const SizedBox(height: 20),
                RegisterSecureTextField(
                  label: tr("new password"),
                  textStyle:const TextStyle(
                    fontFamily: 'DINNextLTW232',
                    color: Color(0xff8a8a8a),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  onChange: (v) => editPass.password = v,
                ),
                const SizedBox(height: 20),
                RegisterSecureTextField(
                  label: tr("Confirm the new password"),
                    textStyle:const TextStyle(
                  fontFamily: 'DINNextLTW232',
                  color: Color(0xff8a8a8a),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                  onChange: (v) => editPass.passwordConfirmation = v,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 30,left: 30),
                  child: InkWell(
                    onTap: () {
                      setState(() => autoError = true);
                      final isValid = _form.currentState.validate();
                      if (!isValid) {
                        return;
                      }
                      _form.currentState.save();
                      if (editPass.password != editPass.passwordConfirmation){
                        CustomAlert().toast(title: tr("Password does not match"));
                      }else {
                        editPass.changePassword();
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
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
                          )
                      ),
                      child: Center(
                        child:  Text(tr("Save new password"),
                            style:const TextStyle(
                              fontFamily: 'DINNextLTW232',
                              color: Color(0xffffffff),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,


                            )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      );
    });
  }
}
