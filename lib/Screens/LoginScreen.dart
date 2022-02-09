import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insuranceprototype/Screens/sample.dart';

import 'RegistrationScreen.dart';


const Color transparent = Color(0x00000000);
const Color layerOneBg = Color(0x80FFFFFF);
const Color layerTwoBg = Color(0xFFE9FFF6);

const Color forgotPasswordText = Color(0xFF024335);
const Color signInButton = Color(0xFF024335);

const Color checkbox = Color(0xFF024335);
const Color signInBox = Color(0xFF024335);

const Color hintText = Color(0xFFB4B4B4);
const Color inputBorder = Color(0xFF707070);
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked = false;
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/primaryBg.png'),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: <Widget>[
            const Positioned(
                top: 150,
                left: 20,
                child: Text(
                  'Welcome,\nTo FuturaInsTech.',
                  style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            Positioned(top: 318, right: 0, bottom: 28, child: Container(
              width: MediaQuery.of(context).size.width,
              height: 584,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(60.0),
                  bottomLeft: Radius.circular(60.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            )
            ),
            Positioned(top: 320, right: 0, bottom: 48, child: SizedBox(
              // height: 584,
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  const Positioned(
                    left: 59,
                    top: 99,
                    child: Text(
                      'Username',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Positioned(
                      left: 59,
                      top: 129,
                      child: SizedBox(
                        width: 390,
                        child: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter User ID or Email',
                            hintStyle: TextStyle(color: hintText),
                          ),
                        ),
                      )),
                  const Positioned(
                    left: 59,
                    top: 199,
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                      left: 59,
                      top: 229,
                      child: SizedBox(
                        width: 390,
                        height: 40,
                        child: TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: hintText),
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                          ),
                        ),
                      )),
                  Positioned(
                      right: 30,
                      top: 270,
                      child: FlatButton(onPressed: () {  }, child: const Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: forgotPasswordText,
                            fontSize: 16,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500),
                      ),

                      )),
                  Positioned(
                      left: 46,
                      top: 361,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ) ),
                  const Positioned(
                      left: 87,
                      top: 375,
                      child: Text(
                        'Remember Me',
                        style: TextStyle(
                            color: forgotPasswordText,
                            fontSize: 16,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500),
                      )),
                  Positioned(
                      top: 365,
                      right: 60,
                      child: Container(
                        width: 99,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: signInButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top:0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LandingScreen()),
                            ); },
                            child: const Text("Sign In",textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Medium',
                                  fontWeight: FontWeight.w400),),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 432,
                      left: 59,
                      child: Container(
                        height: 0.5,
                        width: 390,
                        color: inputBorder,
                      )),
                  Positioned(
                      top: 435,
                      left: 120,
                      child: Container(
                        height: 30,
                        width: 390,
                        child: TextButton(onPressed: () {  },
                          child: Text("create account"),),
                      )
                  ),
                  Positioned(
                      top: 442,
                      left: 120,
                      child: Container(
                        height: 30,
                        width: 390,
                        child:Text("don't have an account"),
                      )
                  ),
                  Positioned(
                      top: 490,
                      left: 120,
                      right: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 59,
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border.all(color: signInBox),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Image.asset(
                              'images/icon_google.png',
                              width: 20,
                              height: 21,
                            ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins-Regular',
                                color: hintText),
                          ),
                          Container(
                            width: 59,
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border.all(color: signInBox),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Image.asset(
                              'images/icon_apple.png',
                              width: 20,
                              height: 21,
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            )
            ),
          ],
        ),
      ),
    );
  }
}


