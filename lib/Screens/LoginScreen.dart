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
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choose Account'),
            content: FutureBuilder(
              future: httpService.getEmployee(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: 300,
                    height: 300,
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey,
                          height: 70,
                          child: Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LandingScreen("51"),
                                      ),
                                    );
                                  },
                                  child: Card(
                                      child: Center(
                                          child: Text(
                                    snapshot.data[index].employeeName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))))),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Icon(Icons.error),
                  );
                } else {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        },
      );
    }

    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        buttonTheme:
            const LoginButtonTheme(backgroundColor: Colors.purpleAccent),
      ),
      title: 'FuturaInsTech',
      onLogin: (LoginData) {
        _showMyDialog();
      },
      onRecoverPassword: (String) {},
      footer: "2022 (c) FuturaInsTech.com",
      loginAfterSignUp: true,
      savedEmail: "rainavimal454@gmail.com",
      savedPassword: "test1234",
    );
  }
}
