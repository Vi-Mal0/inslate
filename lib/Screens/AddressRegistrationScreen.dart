import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressRegstrationScreen extends StatefulWidget {
  const AddressRegstrationScreen({Key? key}) : super(key: key);

  @override
  State<AddressRegstrationScreen> createState() => _AddressRegstrationScreenState();
}

class _AddressRegstrationScreenState extends State<AddressRegstrationScreen> {
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
