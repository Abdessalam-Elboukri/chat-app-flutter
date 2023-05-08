import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../utils/common-images.dart';

import '../utils/colors.dart';
class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  OTPScreen({
    required this.mobileNumber,
  })  ;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  var _otp = TextEditingController();

  var otp_contain =
      "OTP has been sent to you on your mobile number please enter it below.";

  bool isCodeSent = false;
  late String _verificationId;

  TextStyle style = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );


  @override
  void initState() {
    super.initState();
    _onVerifyCode();
  }

  EdgeInsets edgeInsets = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);

// DISSMISS KEYBOARD

  void dismisskeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }


  @override
  Widget build(BuildContext context) {
    // EMAIL INPUT LAYOUT
    final emailField = PinInputField(
      pinLength: 6,
      controller: _otp,
      autoFocus: true,
      textInputAction: TextInputAction.done,
      onSubmit: (pin) {
        if (pin.length == 6) {
          _onFormSubmitted();
        } else {
          log("Invalid OTP");
        }
      }, decoration: pinDecoration,
    );

    // LOGIN BUTTON LAYOUT

    final button = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: bgcolors,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width - 120,
        padding: edgeInsets,
        onPressed: () {
          if (_otp.text.length == 6) {
            _onFormSubmitted();
          } else {
            log("Invalid OTP");
          }
        },
        child: Text("DONE",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors, fontSize: 18.0, fontWeight: FontWeight.w400)),
      ),
    );

//  MAIN CONTAIN

    return Container(
      child: Scaffold(
        backgroundColor: colors,
        resizeToAvoidBottomInset: false,
        body: Column(children: <Widget>[
          SizedBox(
            height: MediaQuery
                .of(context)
                .padding
                .top,
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
                    "Verify mobile Number",
                    style: TextStyle(
                      fontSize: 18,
                      color: bgcolors,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    otp_contain,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: bgcolors,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                    Container(
                    child: TextFormField(
                      controller: TextEditingController(text: "OTP Code"),
                      obscureText: false,
                      style: style,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                      },
                      decoration: InputDecoration(
                        contentPadding: edgeInsets,
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: bgcolors,
                        ),
                        hintText: "",
                        labelText: "",
                        border:
                        new UnderlineInputBorder(borderSide: new BorderSide(color: colors)),
                        errorText: "",
                      ),
                    )
                    ),
                  // Add other widgets here
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

InputDecoration pinDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 16),
  fillColor: Colors.grey[100],
  filled: true,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
);



class _onVerifyCode {
}

class PinInputField  {
  final int pinLength;
  final InputDecoration decoration;
  final TextEditingController controller;
  final bool autoFocus;
  final TextInputAction textInputAction;
  final Function(String) onSubmit;

  PinInputField({
    required this.pinLength,
    required this.decoration,
    required this.controller,
    required this.autoFocus,
    required this.textInputAction,
    required this.onSubmit,
  });
  
}

class _pinDecoration {
}

class _onFormSubmitted {
  
}