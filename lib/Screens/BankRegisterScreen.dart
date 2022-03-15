import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BankRegistrationScreen extends StatefulWidget {
  const BankRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<BankRegistrationScreen> createState() => _BankRegistrationScreenState();
}

class _BankRegistrationScreenState extends State<BankRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
