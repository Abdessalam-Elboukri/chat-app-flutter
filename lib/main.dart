import 'package:flutter/material.dart';
import 'package:flutterprj/screens/OTP-screen.dart';
import 'package:flutterprj/screens/login-screen.dart';
import 'package:flutterprj/screens/register-screen.dart';
import 'package:flutterprj/screens/resetPassword-screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginScreen(),
        "RegistrationScreen": (context) => RegistrationScreen(),
        "ContactList": (context) => RegistrationScreen(),
        "OTPScreen": (context) => OTPScreen( mobileNumber: ''),
        "ResetPassword": (context) => ResetPassword(),
      },
    );
  }
}

