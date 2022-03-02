import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:insuranceprototype/HTTP/HttpService.dart';
import 'package:insuranceprototype/Screens/LandingScreen.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();

    return FlutterLogin(
      theme: LoginTheme(primaryColor: Colors.white,accentColor: Colors.black,buttonTheme: const LoginButtonTheme(backgroundColor: Colors.purpleAccent),),
      title: 'FuturaInsTech',
      onLogin: (LoginData n){ Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => LandingScreen("1")));},
      onRecoverPassword: (String ) {  },
      footer: "2022 (c) FuturaInsTech.com",
      loginAfterSignUp: true,
    );
  }
}

