import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressRegistrationScreen extends StatefulWidget {
  const AddressRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<AddressRegistrationScreen> createState() => _AddressRegistrationScreenState();
}

class _AddressRegistrationScreenState extends State<AddressRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(

              )

            ],
          ),
        ),
      ),
    );  }
}
