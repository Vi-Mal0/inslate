import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddressRegistrationScreen extends StatefulWidget {
  const AddressRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<AddressRegistrationScreen> createState() =>
      _AddressRegistrationScreenState();
}

class _AddressRegistrationScreenState extends State<AddressRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    height: 50,
                    child: ListTile(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      title: const Text(
                        "Agent Registration",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
