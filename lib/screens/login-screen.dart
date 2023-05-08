import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../utils/common-images.dart';

import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _emailValidate = false;
  bool _passwordValidation = false;
  bool _passEye = true;
  var _text = TextEditingController();
  var _passtext = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passworsFocus = FocusNode();

  bool isLoading =false;
  var _emailError = 'Please Enter Email ID';
  var _passwordError = 'Please Enter Password ';

  EdgeInsets edgeInsets = EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0);
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';



  TextStyle style = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    // EMAIL INPUT LAYOUT
    final emailField = TextFormField(
      controller: _text,
      obscureText: false,
      style: style,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        hintText: "",
        labelText: "Email Address",
        border:
        new UnderlineInputBorder(borderSide: new BorderSide(color: colors)),
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        errorText: _emailValidate ? _emailError : null,
      ),
    );

// PASSWORD INPUT LAYOUT
    var passwordField = TextFormField(
      controller: _passtext,
      obscureText: _passEye,
      focusNode: _passworsFocus,
      textInputAction: TextInputAction.done,
      style: style,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        hintText: "",
        labelText: "Password",
        border:
        new UnderlineInputBorder(borderSide: new BorderSide(color: colors)),
        labelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          iconSize: 20.0,
          icon: Icon(Icons.remove_red_eye), onPressed: () {  },
        ),
        errorText: _passwordValidation ? _passwordError : null,
      ),
    );

    // LOGIN BUTTON LAYOUT

    final loginButton = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: bgcolors,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width - 120,
        padding: edgeInsets,
        onPressed: () {
        },
        child: Text("Sign In",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: colors, fontSize: 18.0, fontWeight: FontWeight.w400)),
      ),
    );

    // SOCIAL MEDIA LAYOUT

    // FORGOT PASSWORD

    final forgotPasword = MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RESETPASSWORD);
      },
      child: Text(
        "Forgot Password",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: bgcolors,
        ),
      ),
    );

    // BOTTOM LAYOUT

    final bottomText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Don't have an account ",
          style: TextStyle(
            color: bgcolors,
          ),
        ),
        MaterialButton(
          padding: EdgeInsets.only(left: 5),
          minWidth: 0,
          onPressed: () {
            Navigator.of(context).pushNamed(REGISTRATION_SCREEN);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: bgcolors,
            ),
          ),
        )
      ],
    );

//  MAIN CONTAIN
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: colors),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(color: colors),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  isLoading == false
                      ? Column(
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
                          height: 5.0,
                        ),
                        Text("Welcome Back !!",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: bgcolors,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 20.0,
                        ),
                        emailField,
                        SizedBox(
                          height: 20.0,
                        ),
                        passwordField,
                        SizedBox(
                          height: 20.0,
                        ),
                        loginButton,
                        forgotPasword,
                        bottomText,
                        SizedBox(
                          height: 10.0,
                        ),
                      ])
                      : buildLoader()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoader() {
    return Positioned(
      child: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(bgcolors)),
        ),
        color: colors.withOpacity(0.8),
      )
          : Container(),
    );
  }

  }





