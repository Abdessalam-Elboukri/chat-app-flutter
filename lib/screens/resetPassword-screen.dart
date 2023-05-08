import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/routes.dart';
import '../utils/common-images.dart';

import '../utils/colors.dart';

class ResetPassword extends StatefulWidget {
  @override
  ResetPasswordState createState() => new ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  bool _textvalidate = false;
  final _text = TextEditingController();
  final FocusNode _textFocus = FocusNode();

  TextStyle style = const TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  EdgeInsets edgeInsets = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);

  // CHECK VALIDATION
  void _checkValidation() async {
    if (_text.text.isEmpty) {
      _textvalidate = true;
    } else {
      dismisskeyboard();
      _textvalidate = false;
      Navigator.of(context).pushNamed(OTPSCREEN); // Navigation of login screen
    }
  }

  // PASSWORD RESET PROCESS


// FOR DISSMISS KEYBOARD
  void dismisskeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    //   EMAIL INPUT LAYOUT
    final emailField = TextFormField(
      controller: _text,
      obscureText: false,
      style: style,
      keyboardType: TextInputType.emailAddress,
      focusNode: _textFocus,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: edgeInsets,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        hintText: "",
        labelText: "Email Id",
        border:
        UnderlineInputBorder(borderSide: new BorderSide(color: colors)),
        errorText: _textvalidate ? 'Please Enter Email Id' : null,
      ),
    );


    //   LOGIN BUTTON LAYOUT
    final button = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: bgcolors,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 120,
        padding: edgeInsets,
        onPressed: () {
          _checkValidation();
        },
        child: Text("Done",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors, fontSize: 18.0, fontWeight: FontWeight.w400)),
      ),
    );


//    MAIN CONTAIN
    return Container(
      child: Scaffold(
        backgroundColor: colors,
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  back,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(color: colors),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    logo,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: bgcolors,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "You can reset your password with you email Id.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: bgcolors,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  emailField,
                  SizedBox(
                    height: 30.0,
                  ),
                  button,
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

