import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/LandingScreen.dart';


class SplashHome extends StatefulWidget {
  const SplashHome({Key? key}) : super(key: key);

  @override
  State<SplashHome> createState() => _SplashHome();
}

class _SplashHome extends State<SplashHome> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      navigateUser,
    );
  }

  void navigateUser() async {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (BuildContext context) => LoginScreen()));

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => LandingScreen("12")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/img.png'),
      ),
    );
  }
}
